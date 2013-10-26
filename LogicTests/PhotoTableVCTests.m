//
//  PhotoTableVCTests.m
//  PhotoTableVCTests
//
//  Created by ksenno on 10/25/13.
//  Copyright (c) 2013 com.toshi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhotoTableViewController.h"


@interface PhotoTableVCTests : XCTestCase
@property (nonatomic, strong) PhotoTableViewController *tVC;

@end

@implementation PhotoTableVCTests

@synthesize tVC;

- (void)setUp
{
    [super setUp];
    tVC = [[PhotoTableViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    tVC = nil;
    [super tearDown];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
