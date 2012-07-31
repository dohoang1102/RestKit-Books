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

//- (void) setBook:(Book *)book
//{
//    [self.titleLabel setText:book.bookTitle];
//}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.book) {
        [self.titleLabel setText:self.book.bookTitle];
    }else{
        NSLog(@"no book");
    }
}
@end
