//
//  CMT_ShareBtnView.h
//  CongMingTou
//
//  Created by summer on 17/1/11.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMT_ShareBtnViewDelegate <NSObject>
- (void)myShareBtnAction;
@end

@interface CMT_ShareBtnView : UIView
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (nonatomic,assign)id <CMT_ShareBtnViewDelegate> delegate;

@end
