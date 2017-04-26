//
//  CMT_CycleTitleView.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_CycleTitleView.h"
#import "UpDownViews.h"
#import "CMT_MyGongGModel.h"

@interface CMT_CycleTitleView ()<CAAnimationDelegate>
@property (strong, nonatomic) UpDownViews *updownView;
@property (strong, nonatomic) NSArray *updownDataArray;
@end

@implementation CMT_CycleTitleView{
    NSTimer *timer;
}

static int countInt=0;
static NSString *notice_index;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}

- (void)p_setupViews{
    
    self.backgroundColor = [UIColor whiteColor];
    self.updownView = [[UpDownViews alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topNewsInfoClicked:)];
    self.updownView.userInteractionEnabled = YES;
    [self.updownView addGestureRecognizer:tap];
    [self addSubview:self.updownView];
    
}

- (void)layoutSubviews{
    self.updownView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark -- 传值
- (void)setViewWithUpDownArray:(NSArray *)upDownArray
{
    self.updownDataArray = upDownArray;
    if (self.updownDataArray.count > 0) {
        [self setUpdownViewData];
    }
}

#pragma mark ==== 上下滚动视图
- (void)setUpdownViewData
{
    CMT_MyGongGModel *model =[self.updownDataArray objectAtIndex:0];
    [self.updownView setViewWithHeaderTitle:model.platFormNewsTitle];
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
        self.updownView.alpha = 0.2;
        [self.updownView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        self.updownView.alpha = 1;
    } completion:^(BOOL finished){
        if (self.updownDataArray.count <= 1) {
            if (timer) {
                [timer invalidate];
                timer = nil;
                countInt = 0;
            }
        }else{
            if (!timer) {
                //设置定时器
                timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
            }
        }
    }];
}

-(void)displayNews{
    countInt++;
    if (countInt >= [self.updownDataArray count]){
        countInt = 0;
    }
    if (!(self.updownDataArray.count > 0)) {
        return;
    }
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
   
    CMT_MyGongGModel *model = [self.updownDataArray objectAtIndex:countInt];
    
    [self.updownView.layer addAnimation:animation forKey:@"animationID"];
    [self.updownView setViewWithHeaderTitle:model.platFormNewsTitle];
}
//点击上下滚动视图
-(void)topNewsInfoClicked:(id)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cycleTitleScrolSelectBtnClick:)]) {
        [self.delegate cycleTitleScrolSelectBtnClick:countInt];
    }
}

@end
