//
//  ConfigViewController.m
//  arealvis
//
//  Created by Sergio Kuhs on 27.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"
#import "LevelViewController.h"
#import "xmlParser.h"
#import "DDXML.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController
@synthesize results,xPath;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    DDXMLElement *channel = [results objectAtIndex:indexPath.row];
    DDXMLNode *child = [channel childAtIndex:0];
    
    NSString *channelNum = [child stringValue];
    
    cell.textLabel.text = [NSString stringWithFormat: @"Channel %@ %@",[child name], channelNum];

    
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"elementDetail"]){
        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
        DDXMLElement *channel = [results objectAtIndex:myIndex.row];
        DDXMLNode *child = [channel childAtIndex:0];
        
        NSString *channelNum = [child stringValue];
        
        xPath= [NSString stringWithFormat:@"/config/channel[id=%@]", channelNum];
        NSArray *result2 = [[xmlParser new] withXPath:self.xPath];
        LevelViewController *detailViewController = (LevelViewController *)[segue destinationViewController];
        
        detailViewController.results = result2;
        detailViewController.xPath = xPath;
        detailViewController.title = [NSString stringWithFormat:@"Channel %@", channelNum];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    DDXMLElement *channel = [results objectAtIndex:indexPath.row];
//    DDXMLNode *child = [channel childAtIndex:0];
//    
//    NSString *channelNum = [child stringValue];
//    
//    xPath= [NSString stringWithFormat:@"/config/channel[id=%@]", channelNum];
//    NSArray *result2 = [[xmlParser new] withXPath:self.xPath];
//    LevelViewController *detailViewController = [[LevelViewController alloc] initWithStyle:UITableViewStyleGrouped];
//    detailViewController.xPath = self.xPath;
//    detailViewController.results = result2;
//    detailViewController.title = [NSString stringWithFormat:@"Channel %@", channelNum];
//    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
