//
//  BookTableViewController.h
//  RestKitBooks
//
//  Created by John Ryan on 7/27/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit.h"
#import "RKFetchedResultsTableController.h"

@interface BookTableViewController : UITableViewController<RKFetchedResultsTableControllerDelegate>

@property (nonatomic, retain) RKFetchedResultsTableController *fetchedResultsTableController;

@end
