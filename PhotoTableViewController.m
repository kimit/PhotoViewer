//
//  PhotoTableViewController.m
//  PhotoViewer
//
//  Created by labuser on 2013/10/01.
//  Copyright (c) 2013年 com.toshi. All rights reserved.
//

#import "PhotoTableViewController.h"

@interface PhotoTableViewController ()

@end

@implementation PhotoTableViewController

NSMutableArray *photos;

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowPhoto"]){
        ImageViewController *ivc = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Photo *c = [photos objectAtIndex:[path row]];
        [ivc setCurrentPhoto:c];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    photos = [[NSMutableArray alloc] init];
    
    Photo *pic = [[Photo alloc] init];
    [pic setName:@"beach"];
    [pic setFilename:@"beach.png"];
    [pic setNotes:@"this is beach"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"flag"];
    [pic setFilename:@"flag.png"];
    [pic setNotes:@"this is flag"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"olives"];
    [pic setFilename:@"olives.png"];
    [pic setNotes:@"this is olives"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"overlook"];
    [pic setFilename:@"overlook.png"];
    [pic setNotes:@"this is overlook"];
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    [pic setName:@"winery"];
    [pic setFilename:@"winery.png"];
    [pic setNotes:@"this is winery"];
    [photos addObject:pic];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [photos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Photo *current = [photos objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[current name]];
    
    UIImage *myImage = [UIImage imageNamed:[current filename]];
    [[cell imageView] setImage:myImage];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
