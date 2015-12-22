//
//  MultipleDelegate.m
//  RunTime
//
//  Created by haodai on 15/12/22.
//  Copyright (c) 2015年 zhouyong. All rights reserved.
//

#import "MultipleDelegate.h"
@interface MultipleDelegate ()
@property (nonatomic, strong) NSPointerArray *weakRefTargets;
@end

@implementation MultipleDelegate

- (void)setAllDelegate:(NSArray *)allDelegate {
    self.weakRefTargets = [NSPointerArray weakObjectsPointerArray];
    for (id delegate in allDelegate) {
        [self.weakRefTargets addPointer:(__bridge void *)delegate];
    }
}
/**
 *  消息签名
 *
 *  @param aSelector <#aSelector description#>
 *
 *  @return signature
 */
- (NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (id target in self.weakRefTargets) {
            if ((signature = [target methodSignatureForSelector:aSelector])) {
                break;
            }
        }
    }
    return signature;
}

/**
 *  消息转发
 *
 *  @param anInvocation
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (id target in self.weakRefTargets){
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}


- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    for (id target in self.weakRefTargets){
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}


@end
