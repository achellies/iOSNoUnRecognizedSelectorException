//
//  NSObject+NoUnrecognizedSelector.m
//  NoUnrecognizedSelectorException
//
//  Created by achellies on 14-8-20.
//  Copyright (c) 2014年 achellies. All rights reserved.
//

#import "NSObject+NoUnrecognizedSelector.h"
#import <objc/runtime.h>

@implementation NSObject (NoUnrecognizedSelector)

-(id)emptyMethod:(SEL) sel {
    printf("unrecoginzed selector occurs!(class = %s, method = %s)\n\n", class_getName([self class]), sel_getName(sel));
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (![self respondsToSelector:anInvocation.selector]) {
        SEL sel = [anInvocation selector];
        anInvocation.selector = @selector(emptyMethod:);
        [anInvocation setArgument:&sel atIndex:2];
        [anInvocation invoke];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature * signature = nil;
    Class actualClass = object_getClass(self);
    Method method = class_getInstanceMethod(actualClass, aSelector);
    if (method) {
		char const *encoding = method_getTypeEncoding(method);
		signature = [NSMethodSignature signatureWithObjCTypes:encoding];
    } else {
        method = class_getClassMethod(actualClass, aSelector);
    }
    if (method) {
        char const *encoding = method_getTypeEncoding(method);
		signature = [NSMethodSignature signatureWithObjCTypes:encoding];
    } else {
        signature = [self methodSignatureForSelector:@selector(emptyMethod:)];
    }
    return signature;
}

@end
