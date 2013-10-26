//
//  ImageViewController.m
//  PhotoViewer
//
//  Created by labuser on 2013/10/01.
//  Copyright (c) 2013年 com.toshi. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

@synthesize currentPhoto;
@synthesize currentImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImage *image = [UIImage imageNamed:[currentPhoto filename]];
    [self.currentImage setImage:image];
    [self setTitle:[currentPhoto name]];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InfoViewController *ivc = [segue destinationViewController];
    [ivc setCurrentPhoto:[self currentPhoto]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
