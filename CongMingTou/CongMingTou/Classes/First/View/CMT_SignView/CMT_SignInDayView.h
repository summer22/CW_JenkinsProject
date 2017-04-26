//
//  CMT_SignInDayView.h
//  button
//
//  Created by wzh on 16/10/25.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_SignInDayItemModel.h"
@interface CMT_SignInDayView : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIView *leftLineView;
@property (strong, nonatomic) IBOutlet UIView *midPointView;
@property (strong, nonatomic) IBOutlet UIView *rightLineView;
@property (strong, nonatomic) IBOutlet UIButton *dayBtn;
@property (strong, nonatomic) IBOutlet UILabel *desLab;
@property (strong, nonatomic) IBOutlet UIButton *stateMidBtn;

@property (nonatomic, strong) CMT_SignInDayItemModel *model;
@end
