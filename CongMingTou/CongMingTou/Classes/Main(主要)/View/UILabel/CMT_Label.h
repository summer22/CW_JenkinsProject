//
//  CMT_Label.h
//  CongMingTou
//
//  Created by summer on 16/6/30.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CMT_Label : UILabel{
@private
    CGFloat characterSpacing_;       //字间距
    long    linesSpacing_;           //行间距
    CGFloat paragraphSpacing;        //段间距
}

@property(nonatomic,assign) CGFloat characterSpacing;
@property(nonatomic,assign) CGFloat paragraphSpacing;
@property(nonatomic,assign) long    linesSpacing;
/*
 *绘制前获取label高度
 */
- (int)getAttributedStringHeightWidthValue:(int)width;

@end
