//
//  BookTableViewController.m
//  RestKitBooks
//
//  Created by John Ryan on 7/27/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import "BookTableViewController.h"
#import "BookDetailViewController.h"
@interface BookTableViewController ()

@end

@implementation BookTableViewController
{
    NSIndexPath *currentIndexPath;
}

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
    // This allows us to have a relevant tableView reference for getting the index path and such.
    self.tableView = [self.tableController tableView];
    
    self.tableController.resourcePath = @"/books";
    self.tableController.autoRefreshFromNetwork = YES;
    self.tableController.pullToRefreshEnabled = YES;
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES];
    self.tableController.sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
    [cellMapping mapKeyPath:@"bookTitle" toAttribute:@"textLabel.text"];
    cellMapping.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cellMapping.onSelectCell = ^(){
        
    };
    
    cellMapping.onSelectCellForObjectAtIndexPath = ^(UITableViewCell *cell, id object, NSIndexPath *indexPath){
        // we need to access the indexPath in prepareForSegue
        currentIndexPath = indexPath;
        [self performSegueWithIdentifier:@"Display Book Details" sender:self];
        
    };
    
    [self.tableController mapObjectsWithClass:[Book class] toTableCellsWithMapping:cellMapping];
    
    [self.tableController loadTable];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"Display Book Details"]) {
        Book *selectedBook = [self.tableController objectForRowAtIndexPath:currentIndexPath];
        
        // Pass the selected book to the new view controller.
        BookDetailViewController *detailViewController = (BookDetailViewController *)[segue destinationViewController];
        detailViewController.book = selectedBook;
    }
}
@end
