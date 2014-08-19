//
//  NoUnrecognizedSelectorException.h
//  AdvanceObjectiveC
//
//  Created by achellies on 14-8-19.
//  Copyright (c) 2014年 achellies. All rights reserved.
//
#import <objc/runtime.h>


#define NO_UNRECOGNIZED_SELECTOR \
-(id)emptyMethod:(SEL) sel { \
printf("unrecoginzed selector occurs!(class = %s, method = %s.\n)", class_getName([self class]), sel_getName(sel)); \
return nil; \
} \
- (void)forwardInvocation:(NSInvocation *)anInvocation { \
if (![self respondsToSelector:anInvocation.selector]) { \
SEL sel = [anInvocation selector]; \
anInvocation.selector = @selector(emptyMethod:); \
[anInvocation setArgument:&sel atIndex:2]; \
[anInvocation invoke]; \
} \
} \
- (id)forwardingTargetForSelector:(SEL)aSelector { \
id target = [super forwardingTargetForSelector:aSelector]; \
if (!target) { \
target = self; \
} \
return target; \
} \
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector { \
NSMethodSignature * signature = [super methodSignatureForSelector:aSelector]; \
if (!signature) { \
signature = [self methodSignatureForSelector:@selector(emptyMethod:)]; \
} \
return signature; \
}
