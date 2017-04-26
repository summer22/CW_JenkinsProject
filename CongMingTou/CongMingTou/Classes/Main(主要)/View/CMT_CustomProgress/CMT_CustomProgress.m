//
//  CMT_CustomProgress.m
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_CustomProgress.h"

@interface CMT_CustomProgress()
//{
//    UIView *bgView;
//    UIImageView *whiteLineImg;
//    UILabel *percentLabel;
//    UIImageView *iconImg;
//}
@end

@implementation CMT_CustomProgress

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
//        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
//        [self setUI];
    }
    return self;
}

//- (void)setUI{
//    
//    bgView = [[UIView alloc] init];
//    bgView.backgroundColor = [CMT_Tools colorWithHexString:@"#0092eb"];
//    [self addSubview:bgView];
//    
//    whiteLineImg = [[UIImageView alloc] init];
//    whiteLineImg.backgroundColor = [UIColor whiteColor];
//    [bgView addSubview:whiteLineImg];
//    
//    percentLabel = [[UILabel alloc] init];
//    percentLabel.textColor = [UIColor whiteColor];
//    percentLabel.text = @"0%";
//    percentLabel.font = [UIFont boldSystemFontOfSize:12];
//    [self addSubview:percentLabel];
//    
//    iconImg = [[UIImageView alloc] init];
//    iconImg.backgroundColor = [UIColor clearColor];
//    iconImg.image = [UIImage imageNamed:@"CMT_ProgressD"];
//    [self addSubview:iconImg];
//}
//
//- (void)layoutSubviews{
//    bgView.frame = CGRectMake(0, 22, self.frame.size.width, 1.5);
//    whiteLineImg.frame = CGRectMake(0, 0, 0, 1.5);
//    iconImg.frame = CGRectMake(-2, 18, 9, 9);
//    percentLabel.frame = CGRectMake(0, 0, 40, 25);
//}
//
//- (void)setProgress:(NSInteger)progressValue{
//    NSInteger edgeValue;
//        whiteLineImg.frame = CGRectMake(0, 0, progressValue * self.frame.size.width, 1.5);
//        iconImg.frame = CGRectMake(progressValue * self.frame.size.width-5, 18, 9, 9);
//    if (progressValue == 1) {
//        edgeValue = 15;
//    }else if(progressValue == 0){
//        edgeValue = 5;
//    }
//        percentLabel.frame = CGRectMake(progressValue * self.frame.size.width-edgeValue, 4, 40, 20);
//        percentLabel.text = [[NSString stringWithFormat:@"%ld",progressValue * 100] stringByAppendingString:@"%"];
//    [self layoutIfNeeded];
//}

@end
