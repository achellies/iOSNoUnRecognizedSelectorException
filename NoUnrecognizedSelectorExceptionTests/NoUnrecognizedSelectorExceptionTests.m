//
//  NoUnrecognizedSelectorExceptionTests.m
//  NoUnrecognizedSelectorExceptionTests
//
//  Created by achellies on 14-8-19.
//  Copyright (c) 2014年 achellies. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NoUnrecognizedSelectorExceptionTests : XCTestCase

@end

@implementation NoUnrecognizedSelectorExceptionTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
