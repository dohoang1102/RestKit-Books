//
//  BookDetailViewController.m
//  RestKitBooks
//
//  Created by John Ryan on 7/31/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import "BookDetailViewController.h"

@interface BookDetailViewController ()

@property IBOutlet UILabel *titleLabel;

@end

@implementation BookDetailViewController

@synthesize titleLabel = _titleLabel;
@synthesize book = _book;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configureTitleBar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateInterface];
}

- (void)configureTitleBar
{
    // Configure the title, title bar, and table view.
    self.title = @"Info";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)updateInterface
{
    [self.titleLabel setText:self.book.bookTitle];
}

#pragma mark editing nonsense.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    // Hide the back button when editing starts, and show it again when editing finishes.
    [self.navigationItem setHidesBackButton:editing animated:animated];
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

@end
