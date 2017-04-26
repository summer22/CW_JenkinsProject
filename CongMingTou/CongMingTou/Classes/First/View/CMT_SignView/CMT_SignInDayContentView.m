//
//  CMT_SignInDayContentView.m
//  button
//
//  Created by wzh on 16/10/26.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "CMT_SignInDayContentView.h"
#import "CMT_SignInDayView.h"

#define CMT_ItemNum 7
#define CMT_ItemWeight [UIScreen mainScreen].bounds.size.width / CMT_ItemNum

@implementation CMT_SignInDayContentView


- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self =[[[NSBundle mainBundle] loadNibNamed:@"CMT_SignInDayView" owner:nil options:nil]lastObject];
        [self createSignInDayUI];

    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self createSignInDayUI];
}

- (void)createSignInDayUI{
    for (int i = 0; i < CMT_ItemNum; i ++) {
        CMT_SignInDayView *signInDayView = [[CMT_SignInDayView alloc]init];
        signInDayView.tag = i;
        [self addSubview:signInDayView];
    }
}

- (void)setDataArray:(NSArray *)dataArray{
    self.myArray = dataArray;
    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    int i = 0;
    CGFloat width = self.frame.size.width / self.subviews.count;
    for (UIView *subView in self.subviews) {

        CMT_SignInDayView *signInDayView = (CMT_SignInDayView *)subView;
        signInDayView.frame = CGRectMake(i * width, 0, width, width);
        if(i < self.myArray.count){
            signInDayView.model = self.myArray[i];
        }
        if(i == 0){
            signInDayView.leftLineView.hidden = YES;
        }
        if(i == self.subviews.count - 1){
            signInDayView.rightLineView.hidden = YES;
        }
        i ++;
    }
}
@end
