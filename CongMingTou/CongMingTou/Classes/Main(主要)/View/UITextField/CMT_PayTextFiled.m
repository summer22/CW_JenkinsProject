//
//  CMT_PayTextFiled.m
//  CongMingTou
//
//  Created by summer on 16/5/11.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "CMT_PayTextFiled.h"

@implementation CMT_PayTextFiled

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = CommonWhiteColor;
        self.layer.borderColor = [CMT_Tools colorWithHexString:@"#b3b3b3"].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.tintColor = [UIColor clearColor];//看不到光标
        self.textColor = [UIColor clearColor];//看不到输入内容
//        self.layer.shadowColor = [CMT_Tools colorWithHexString:@"#b3b3b3"].CGColor;//shadowColor阴影颜色
//        self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
//        self.layer.shadowOpacity = 0.5;//阴影透明度，默认0
//        self.layer.shadowRadius = 8;//阴影半径，默认3
        self.clipsToBounds = NO;
        self.keyboardType = UIKeyboardTypeNumberPad;
        self.secureTextEntry = YES;

        
        CGFloat perWidth = (frame.size.width - kPasswordLength + 1)*1.0/kPasswordLength;
        for(NSInteger i=0;i<kPasswordLength;i++){
            if(i < kPasswordLength - 1){
                UILabel *vLine = (UILabel *)[self viewWithTag:kLineTag + i];
                if(!vLine){
                    vLine = [[UILabel alloc]init];
                    vLine.tag = kLineTag + i;
                    [self addSubview:vLine];
                }
                vLine.frame = CGRectMake(perWidth + (perWidth + 1)*i, 0, 1, frame.size.height);
                vLine.backgroundColor = [CMT_Tools colorWithHexString:@"#b3b3b3"];
            }
            UILabel *dotLabel = (UILabel *)[self viewWithTag:kDotTag + i];
            if(!dotLabel){
                dotLabel = [[UILabel alloc]init];
                dotLabel.tag = kDotTag + i;
                [self addSubview:dotLabel];
            }
            dotLabel.frame = CGRectMake((perWidth + 1)*i + (perWidth - 10)*0.5, (frame.size.height - 10)*0.5, 10, 10);
            dotLabel.layer.masksToBounds = YES;
            dotLabel.layer.cornerRadius = 5;
            dotLabel.backgroundColor = CommonGrayColor;
            dotLabel.hidden = YES;
        }

    }
    return self;
}

//禁止复制粘帖
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if(menuController){
        menuController.menuVisible = NO;
    }
    return NO;
}
@end
