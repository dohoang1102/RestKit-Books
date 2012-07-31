//
//  BookTableViewController.m
//  RestKitBooks
//
//  Created by John Ryan on 7/27/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import "BookTableViewController.h"

@interface BookTableViewController ()

@end

@implementation BookTableViewController

@synthesize tableController = _tableController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableController = [[RKObjectManager sharedManager] fetchedResultsTableControllerForTableViewController:self];
    
    self.tableController.resourcePath = @"/books";
    self.tableController.autoRefreshFromNetwork = YES;
    self.tableController.pullToRefreshEnabled = YES;
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES];
    self.tableController.sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
    [cellMapping mapKeyPath:@"bookTitle" toAttribute:@"textLabel.text"];
    cellMapping.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cellMapping.onSelectCell = ^(){
        [self performSegueWithIdentifier:@"Display Book Details" sender:self];
    };
    
    [self.tableController mapObjectsWithClass:[Book class] toTableCellsWithMapping:cellMapping];
    
    [self.tableController loadTable];
}
@end
