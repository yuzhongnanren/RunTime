//
//  UIViewController+swizzle.m
//  RunTime
//
//  Created by haodai on 15/12/22.
//  Copyright (c) 2015年 zhouyong. All rights reserved.
//

#import "UIViewController+swizzle.h"
#import <objc/runtime.h>

@implementation UIViewController (swizzle)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self.class, @selector(viewWillAppear:)), class_getInstanceMethod(self, @selector(swizzleViewWillAppear:)));
    });
}

- (void)swizzleViewWillAppear:(BOOL)animated {
    NSLog(@"1");
    [self swizzleViewWillAppear:animated];
}

@end
