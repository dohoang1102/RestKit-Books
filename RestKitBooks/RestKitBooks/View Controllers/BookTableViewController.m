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

@synthesize fetchedResultsTableController = _fetchedResultsTableController;

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

    
    
//    self.fetchedResultsTableController = [[RKFetchedResultsTableController alloc] initWithTableView:self.tableView viewController:self];
//    [self.fetchedResultsTableController setDelegate:self];
//    [self.fetchedResultsTableController setObjectManager:[RKObjectManager sharedManager]];
////    [self.fetchedResultsTableController loadTableWithObjectLoader:[[RKObjectManager sharedManager] loaderWithResourcePath:@"/books.json"]];
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    [fetchRequest setSortDescriptors:nil];
//    NSEntityDescription *entityDescription = [NSEntityDescription
//                                              entityForName:@"Book" inManagedObjectContext:[RKObjectManager sharedManager].objectStore.managedObjectContextForCurrentThread];
//    [fetchRequest setEntity:entityDescription];
//    [self.fetchedResultsTableController setFetchRequest:fetchRequest];
//    [self.fetchedResultsTableController setResourcePath:@"/books.json"];
//    [self.fetchedResultsTableController loadTable];
    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/books" delegate:self];

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
    return [self.fetchedResultsTableController numberOfSectionsInTableView:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fetchedResultsTableController numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark temporary
-(void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    NSLog(@"Loaded %d objects into BookTableViewController", [objects count]);
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"Error : %@", error);
}
@end
