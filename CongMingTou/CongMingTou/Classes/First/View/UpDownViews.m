//
//  UpDownViews.m
//  XXxfs
//
//  Created by 刘永杰 on 16/9/29.
//  Copyright © 2016年 xjk. All rights reserved.
//

#import "UpDownViews.h"

@interface UpDownViews ()

@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation UpDownViews

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}

- (void)p_setupViews{
    
    self.headImageView = [[UIImageView alloc] init];
    self.headImageView.backgroundColor = CommonBlackColor;
    [self addSubview:self.headImageView];

    self.titleLabel = [[UILabel alloc] init];
    self.center = self.headImageView.center;
    self.titleLabel.textColor = CommonBlackColor;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.titleLabel];
    
}

- (void)layoutSubviews{
    self.headImageView.frame = CGRectMake(0, 15, 5, 5);
    self.headImageView.layer.cornerRadius = 2.5;
    self.headImageView.layer.masksToBounds = YES;
    self.titleLabel.frame = CGRectMake(self.headImageView.right + 12, 0, self.frame.size.width - 30, 36);
}

//更新数据
- (void)setViewWithHeaderTitle:(NSString *)title
{
    self.titleLabel.text = title;
}


@end
