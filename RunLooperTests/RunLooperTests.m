//
//  RunLooperTests.m
//  RunLooperTests
//
//  Created by mar Jinn on 7/8/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RunLooperTests : XCTestCase

@end

@implementation RunLooperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
