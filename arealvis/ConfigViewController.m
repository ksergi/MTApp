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
#import "ConfigCell.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController
@synthesize results,xPath;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
               
    }
    return self;
}

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable:)
                                                 name:@"xmlsavefinished"
                                               object:nil];
    xPath = @"/config/channel";
    results = [[xmlParser alloc] withXPath:xPath];
    [super viewDidLoad];
}

- (void)reloadTable:(NSNotification *)notif {
    
    xPath = @"/config/channel";
    results = [[xmlParser alloc] withXPath:xPath];
    
    [self.tableView reloadData];

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
    ConfigCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    DDXMLElement *channel = [results objectAtIndex:indexPath.row];
    DDXMLNode *child = [channel childAtIndex:0];
    
    NSString *channelNum = [child stringValue];
    
    cell.textLabel.text = [NSString stringWithFormat: @"Channel %@ %@",[child name], channelNum];

    
    return cell;
}


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
    
    

}

@end
