//
//  NextViewController.m
//  arealvis
//
//  Created by Sergio Kuhs on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define MAINLABEL_TAG 101
#define SECONDLABEL_TAG 2
#define PHOTO_TAG 3



#import "NextViewController.h"
#import "DDXML.h"
#import "xmlParser.h"
#import "NextViewCell.h"

@interface NextViewController ()

@end

@implementation NextViewController
@synthesize results, xPath;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:(UIBarButtonItemStylePlain) target:self action:@selector(save2xml:)];
        self.navigationItem.rightBarButtonItem.enabled =1;
        self.tableView.rowHeight = 60;
        
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
    DDXMLElement *element = [self.results objectAtIndex:0];
    
    return [element childCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // UILabel *mainLabel;
   // UITextField *textField;
    
    if (cell == nil) {
        cell = [[NextViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

        
    } else {
        
        cell.nameLabel = (UILabel *)[cell.contentView viewWithTag:MAINLABEL_TAG];
        cell.textField = (UITextField *)[cell.contentView viewWithTag:SECONDLABEL_TAG];
        
    }
    // Configure the cell...
    DDXMLElement *channel = [self.results objectAtIndex:0];
    DDXMLNode *child = [channel childAtIndex:indexPath.row];
        
    if (child.nextNode.kind == 1 ) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.nameLabel.backgroundColor =[UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.nameLabel.text = [child name];
        cell.textField.text = @"";
        cell.textField.enabled = 0;
    }
    else
        
        if (child.nextNode.kind == 3 ) {
            cell.backgroundColor = [UIColor yellowColor];
            cell.nameLabel.backgroundColor =[UIColor yellowColor];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.nameLabel.text = [child name];
            cell.textField.text = child.stringValue;
        }
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController   *detailViewController = [[NextViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    DDXMLElement *channel = [self.results objectAtIndex:0];
    DDXMLNode *child = [channel childAtIndex:indexPath.row];
    
    //NSLog(@"Level %d", child.level);
    
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

-(IBAction)save2xml:(id)sender{
    
    
    NSLog(@"save");
    
    

}




@end
