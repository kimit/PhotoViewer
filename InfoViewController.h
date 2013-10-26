//
//  InfoViewController.h
//  PhotoViewer
//
//  Created by labuser on 2013/10/01.
//  Copyright (c) 2013年 com.toshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface InfoViewController : UIViewController

@property (nonatomic, strong) Photo *currentPhoto;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
- (IBAction)dismiss:(id)sender;

@end
