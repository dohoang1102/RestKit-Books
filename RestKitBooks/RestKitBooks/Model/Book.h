//
//  Book.h
//  RestKitBooks
//
//  Created by John Ryan on 7/30/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSNumber * bookID;
@property (nonatomic, retain) NSString * bookTitle;

@end
