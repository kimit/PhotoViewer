//
//  AsyncTest.m
//  PhotoViewer
//
//  Created by ksenno on 10/24/13.
//  Copyright (c) 2013 com.toshi. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

@interface AsyncTest : GHAsyncTestCase { }
@property (atomic, strong) NSString *apiResponse;
@property (atomic, strong) NSURLRequest *request;
@property (atomic, strong) NSURLConnection *connection;
@end

@implementation AsyncTest
@synthesize apiResponse;
@synthesize request;
@synthesize connection;

- (void)setUp {
    [super setUp];
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weather.yahooapis.com/forecastrss?w=2502265"]];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

-(void)tearDown {
    
    request = nil;
    connection = nil;
    
    [super tearDown];
    
}

- (void)testUnitInResponse {
    
    // Call prepare to setup the asynchronous action.
    // This helps in cases where the action is synchronous and the
    // action occurs before the wait is actually called.
    [self prepare];
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weather.yahooapis.com/forecastrss?w=2502265"]];
    //NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    // Wait until notify called for timeout (seconds); If notify is not called with kGHUnitWaitStatusSuccess then
    // we will throw an error.
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    GHAssertTrue([self.apiResponse rangeOfString:@"<yweather:units temperature=\"F\" distance=\"mi\" pressure=\"in\" speed=\"mph\"/>"].location != NSNotFound, @"Response string does not contain unit information");
}


- (void) testLocationInResponse
{
    [self prepare];
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weather.yahooapis.com/forecastrss?w=2502265"]];
    //NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    GHAssertTrue([self.apiResponse rangeOfString:@"<yweather:location city=\"Sunnyvale\" region=\"CA\"   country=\"United States\"/>"].location != NSNotFound, @"Response string does not contain Sunnyvale location");
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // Notify of success, specifying the method where wait is called.
    // This prevents stray notifies from affecting other tests.
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testUnitInResponse)];
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testLocationInResponse)];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Notify of connection failure
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testUnitInResponse)];
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testLocationInResponse)];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    GHTestLog(response);
    [self setApiResponse:response];
}

@end
