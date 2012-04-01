//
//  LevelViewController.m
//  arealvis
//
//  Created by Sergio Kuhs on 27.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelViewController.h"
#import "NextViewController.h"
#import "DDXML.h"
#import "xmlParser.h"

@interface LevelViewController ()

@end

@implementation LevelViewController
@synthesize results, xPath;

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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    DDXMLElement *element = [self.results objectAtIndex:0];
    
    return [element childCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailCell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    UILabel *detailLabel = (UILabel *)[cell viewWithTag:101];
    UITextField *elementValueText = (UITextField *) [cell viewWithTag:102];
    
    DDXMLElement *channel = [self.results objectAtIndex:0];
    DDXMLNode *child = [channel childAtIndex:indexPath.row];
    
    
    nameLabel.text = [child name];
    if ([child.nextNode.name isEqualToString: @"text"]) {
        elementValueText.text = [child stringValue];
        detailLabel.text = [child stringValue];
    }
    

    
    
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
//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([[segue identifier] isEqualToString:@"nextLevel"]){
//       
//        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
//        
//        DDXMLElement *channel = [results objectAtIndex:0];
//        DDXMLNode *child = [channel childAtIndex:myIndex.row];
//        
//       // NSString *channelNum = [child stringValue];
//        
//        //xPath= [NSString stringWithFormat:@"/config/channel[id=%@]", channelNum];
//        //NSArray *result2 = [[xmlParser new] withXPath:self.xPath];
//        
//        //LevelViewController *otherLevel = (LevelViewController *)[segue destinationViewController];
//        
//        LevelViewController   *nextLevel = [segue destinationViewController];
//        //otherLevel = (LevelViewController *)[segue destinationViewController];
//       
//       
//        NSLog(@"Level %d", child.level);
//        
//        if ([child.nextNode.name isEqualToString: @"text"] ) {
//            
//            
//        }
//        else {
//            NSString *newxPath = [NSString stringWithFormat:@"%@/%@", xPath, child.name];
//            NSLog(@"%@", newxPath);
//            nextLevel.xPath = newxPath;
//            
//            NSArray *newResults = [[xmlParser new] withXPath:newxPath];
//            nextLevel.results = newResults;
//            [self.navigationController pushViewController:nextLevel animated:NO];
//           
//        }
//
//    }
//}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"check");
    
    NextViewController   *detailViewController = [[NextViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    DDXMLElement *channel = [self.results objectAtIndex:0];
    DDXMLNode *child = [channel childAtIndex:indexPath.row];
    
    NSLog(@"Level %d", child.level);
    
    if ([child.nextNode.name isEqualToString: @"text"] ) {
        
        
    }
    else {
        NSString *newxPath = [NSString stringWithFormat:@"%@/%@", xPath, child.name];
        NSLog(@"%@", newxPath);
        detailViewController.xPath = newxPath;
        
        NSArray *newResults = [[xmlParser new] withXPath:newxPath];
        detailViewController.results = newResults;
        detailViewController.title = child.name;
        
        [self.navigationController pushViewController:detailViewController animated:YES];
       
        
    }

}

@end
