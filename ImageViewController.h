//
//  ImageViewController.h
//  PhotoViewer
//
//  Created by labuser on 2013/10/01.
//  Copyright (c) 2013年 com.toshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "InfoViewController.h"

@interface ImageViewController : UIViewController

@property (nonatomic, strong) Photo *currentPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end
