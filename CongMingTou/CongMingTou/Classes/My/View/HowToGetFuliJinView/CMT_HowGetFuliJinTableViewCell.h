//
//  CMT_HowGetFuliJinTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_HowToGetFLJModel.h"

@protocol CMT_HowGetFuliJinTableViewCellDelegate <NSObject>
//签到点击
- (void)toFinishBtnClick:(NSInteger)index;
@end

@interface CMT_HowGetFuliJinTableViewCell : UITableViewCell
/** delegatee*/
@property (nonatomic,assign)id <CMT_HowGetFuliJinTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
/** index*/
@property (nonatomic,assign)NSInteger index;
+ (CMT_HowGetFuliJinTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setMyModel:(CMT_HowToGetFLJModel *)myModel index:(NSIndexPath *)indexPath;

@end
