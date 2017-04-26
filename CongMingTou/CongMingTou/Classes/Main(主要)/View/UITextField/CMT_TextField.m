//
//  CMT_TextField.m
//  CongMingTou
//
//  Created by summer on 2016/11/9.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_TextField.h"

@implementation CMT_TextField

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self setClearBtn];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setClearBtn];
    }
    
    return self;
}

- (void)setClearBtn{
    
//    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    clearBtn.frame = CGRectMake(10, 0, 14, 14);
//    [clearBtn setImage:[UIImage imageNamed:@"CMT_ClearBtn"] forState:UIControlStateNormal];
//    [clearBtn addTarget:self action:@selector(clearTextFieldContent) forControlEvents:UIControlEventTouchUpInside];
//    self.rightView = clearBtn;
//    self.rightViewMode = UITextFieldViewModeWhileEditing;
    
    UIButton *button = [self valueForKey:@"_clearButton"];
    [button setImage:[UIImage imageNamed:@"CMT_ClearBtn"] forState:UIControlStateNormal];
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
}

//- (void)clearTextFieldContent{
//    self.text = nil;
//}
//
//- (CGRect)placeholderRectForBounds:(CGRect)bounds{
//    return CGRectMake(0, 0, bounds.size.width - 22, bounds.size.height);
//}
//
//- (CGRect)textRectForBounds:(CGRect)bounds{
//    return CGRectMake(0, 0, bounds.size.width - 22, bounds.size.height);
//}
//
//- (CGRect)editingRectForBounds:(CGRect)bounds{
//    return CGRectMake(0, 0, bounds.size.width - 22, bounds.size.height);
//}

@end
