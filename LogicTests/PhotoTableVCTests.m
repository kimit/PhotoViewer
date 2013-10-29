//
//  PhotoTableVCTests.m
//  PhotoTableVCTests
//
//  Created by ksenno on 10/25/13.
//  Copyright (c) 2013 com.toshi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhotoTableViewController.h"
#import <OCMock/OCMock.h>
#import "Photo.h"

@interface PhotoTableVCTests : XCTestCase
@property (nonatomic, strong) PhotoTableViewController *tVC;

@end

@implementation PhotoTableVCTests

@synthesize tVC;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    tVC = [[PhotoTableViewController alloc] init];
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    tVC = nil;
    [super tearDown];
}

- (void)testViewControllerBuilt
{
    XCTAssertNotNil(tVC, @"PhotoTableViewController is not created.");
}

-(void) testPhotoReturnName
{
    id mockPhoto = [OCMockObject mockForClass:[Photo class]];
    
    [[[mockPhoto stub] andReturn:@"toshi"] returnName];
    XCTAssertEqualObjects([mockPhoto returnName], @"toshi", @"Name should be toshi");
}

-(void) testPhotoCalc
{
    id mockPhoto = [OCMockObject mockForClass:[Photo class]];
    
    [[[mockPhoto stub] andReturnValue:OCMOCK_VALUE((int){10})] calc:1 secondInt:3];
    XCTAssertEqual([mockPhoto calc:1 secondInt:3], 10, @"result should be 10");
}

-(void) testParticalMockVerify
{
   
    Photo *myPhoto = [[Photo alloc] init];
    
    id partialMockPhoto = [OCMockObject partialMockForObject:myPhoto];
    int result = [partialMockPhoto calc:5 secondInt:3]; // This is not counted for verify because it is not expected, yet.
    NSLog(@"&&&&&&& result is %i &&&&&&&&&", result);
    
    [[partialMockPhoto expect] calc:5 secondInt:3];
    [partialMockPhoto calc:5 secondInt:3]; // This one is expected.
    [partialMockPhoto verify];
}

-(void) testNormalMockVerify
{
    id normalMockPhoto = [OCMockObject mockForClass:[Photo class]];
    //[normalMockPhoto calc:3 secondInt:8]; //Invocatin of method without expect will raise an exception.
    [normalMockPhoto verify];
}

-(void) testNiceMockVerify
{
    id niceMockPhoto = [OCMockObject niceMockForClass:[Photo class]];
    [niceMockPhoto calc:8 secondInt:2]; //NiceMock does not raise an exception for invoking a method without expect
    [niceMockPhoto verify];
}

@end
