//
//  CMT_CalculatorViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_CalculatorViewController.h"
#import "CMT_BidPlanModel.h"

@interface CMT_CalculatorViewController ()<TXHRrettyRulerDelegate,AKPickerViewDataSource, AKPickerViewDelegate>
//标的产品数据源
@property (nonatomic, strong) NSArray *titles;
/** 数据源 */
@property (nonatomic,strong)NSArray *dataSoureArr;
/** 模型 */
@property (nonatomic,strong)CMT_BidPlanModel *bidPlanmodel;
@end

@implementation CMT_CalculatorViewController{
    TXHRrettyRuler *ruler;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}

#pragma mark - 加载标的选择器数据
- (void)loadData{
    __weak  typeof(self) weakSelf = self;
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getCalculatorInfoWithBlock:^(CMT_homeModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                weakSelf.dataSoureArr = myModel.bidPlanArr;
                if (myModel.bidPlanArr.count > 0) {
                    if (8.0f <= SystemV && SystemV < 9.0f ) {
                        [weakSelf.akPicker reloadData];
                    }else{
                        for (int i = 0; i < myModel.bidPlanArr.count; i++) {
                            CMT_BidPlanModel *model = myModel.bidPlanArr[i];
                            if ([model.period isEqualToString:weakSelf.selectPeriod]) {
                                [weakSelf.akPicker selectItem:i animated:YES];
                                [weakSelf.akPicker reloadData];
                            }
                        }
                    }
                }
            }
            else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                    [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }
            else{
                [self showHint:myModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收益计算器";
    [self setCalculator];
    [self setPickerView];
    self.myTF.text = @"10000";
}

#pragma mark - 投资金额刻度尺
- (void)setCalculator{
    // 2.创建 TXHRrettyRuler 对象 并设置代理对象
    ruler = [[TXHRrettyRuler alloc] initWithFrame:CGRectMake(20, 99, [UIScreen mainScreen].bounds.size.width - 20 * 2, 80)];
    ruler.rulerDeletate = self;
    [ruler showRulerScrollViewWithCount:1000 average:[NSNumber numberWithFloat:0.1] currentValue:1.00f smallMode:YES];
    [self.view insertSubview:ruler aboveSubview:_rulerBgView];
}

#pragma mark - 标的选择器
- (void)setPickerView{
    self.akPicker.delegate = self;
    self.akPicker.dataSource = self;
    self.akPicker.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.akPicker.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
    self.akPicker.interitemSpacing = 20.0;
    self.akPicker.fisheyeFactor = 0.001;
    self.akPicker.pickerViewStyle = AKPickerViewStyle3D;
    self.akPicker.maskDisabled = false;
}

#pragma mark - RrettyRulerDelegate
- (void)txhRrettyRuler:(TXHRulerScrollView *)rulerScrollView {
    if (rulerScrollView.rulerValue <= 0) {
        self.myTF.text = @"0.00";
    } else {
        self.myTF.text = [NSString stringWithFormat:@"%.ld",(long)(rulerScrollView.rulerValue * 10000)];
    }
    [self expectProfit];
}

- (IBAction)tfTouchD:(id)sender {
    if ([self.myTF.text isEqualToString:@"0.00"]) {
        self.myTF.text = @"";
    }
}

#pragma mark -- 监听输入框
- (IBAction)myTextFValue:(id)sender {
//    [ruler setInputValueAutoMoveScroll];
    [self expectProfit];
}

#pragma mark - AKPickerViewDataSource
- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView{
    return [self.dataSoureArr count];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item{
    return [self.dataSoureArr[item] planTitle];
}

#pragma mark - AKPickerViewDelegate

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item size:(CGSize)selectSize{
    
    self.bidPlanmodel = self.dataSoureArr[item];
    [self expectProfit];
}

- (void)expectProfit{
    self.expectNumb.text = [CMT_Tools apr:[[self.bidPlanmodel apr] floatValue] addPercent:0.0f investAmount:[self.myTF.text floatValue] investDay:[[self.bidPlanmodel period] floatValue]  welfareAmount:0.0f];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
