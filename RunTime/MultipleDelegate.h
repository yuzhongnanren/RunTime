//
//  MultipleDelegate.h
//  RunTime
//
//  Created by haodai on 15/12/22.
//  Copyright (c) 2015年 zhouyong. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  runtime 消息转发 delegate 分发给多个对象
 */
@interface MultipleDelegate : NSObject
@property(nonatomic,strong)NSArray *allDelegate;

@end
