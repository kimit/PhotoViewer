//
//  Photo.h
//  PhotoViewer
//
//  Created by labuser on 2013/10/01.
//  Copyright (c) 2013年 com.toshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *notes;

- (int) calc:(int)first secondInt:(int) second;
- (NSString *) returnName;

@end
