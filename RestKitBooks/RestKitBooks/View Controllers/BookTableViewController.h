//
//  BookTableViewController.h
//  RestKitBooks
//
//  Created by John Ryan on 7/27/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit.h"
#import "Restkit/UI.h"
#import "RKFetchedResultsTableController.h"
#import "Book.h"
@interface BookTableViewController : UITableViewController

@property (nonatomic, retain) RKFetchedResultsTableController  *tableController;

@end
