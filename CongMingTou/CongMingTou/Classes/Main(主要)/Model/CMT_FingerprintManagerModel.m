//
//  CMT_FingerprintManagerModel.m
//  CongMingTou
//
//  Created by wzh on 16/5/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FingerprintManagerModel.h"

@implementation CMT_FingerprintManagerModel
/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {

        self.fingerprintOpenState = [[decoder decodeObjectForKey:@"fingerprintOpenState"] intValue];
        self.fingerPayOpenState = [[decoder decodeObjectForKey:@"fingerPayOpenState"] intValue];

    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:[NSNumber numberWithInteger:self.fingerprintOpenState] forKey:@"fingerprintOpenState"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.fingerPayOpenState] forKey:@"fingerPayOpenState"];

}
@end
