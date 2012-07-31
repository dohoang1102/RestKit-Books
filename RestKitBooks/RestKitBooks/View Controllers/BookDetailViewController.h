//
//  BookDetailViewController.h
//  RestKitBooks
//
//  Created by John Ryan on 7/31/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
@interface BookDetailViewController : UITableViewController

@property (nonatomic, retain) Book *book;

@end
