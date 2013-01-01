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
#import "LevelCell.h"

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
     LevelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    
    DDXMLElement *channel = [self.results objectAtIndex:0];
    DDXMLNode *child = [channel childAtIndex:indexPath.row];
    
    
    cell.nameLabel.text = [child name];

    return cell;
}





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController   *detailViewController = [[NextViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    DDXMLElement *channel = [self.results objectAtIndex:0];
    DDXMLNode *child = [channel childAtIndex:indexPath.row];
    
    if ([child.nextNode.name isEqualToString: @"text"] ) {
        
        
    }
    else {
        NSString *newxPath = [NSString stringWithFormat:@"%@/%@", xPath, child.name];
        detailViewController.xPath = newxPath;
        NSArray *newResults = [[xmlParser new] withXPath:newxPath];
        detailViewController.results = newResults;
        detailViewController.title = child.name;
        [self.navigationController pushViewController:detailViewController animated:YES];
       
        
    }

}

@end
