//
//  BookMappingBrovider.m
//  RestKitBooks
//
//  Created by John Ryan on 7/31/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import "BookMappingProvider.h"
#import "Book.h"

@implementation BookMappingProvider

@synthesize objectStore = _objectStore;

+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore {
    return [[self alloc] initWithObjectStore:objectStore];
}

-(id)initWithObjectStore:(RKManagedObjectStore *)objectStore
{
    self = [super init];
    if(self) {
        self.objectStore = objectStore;
        
        [self setObjectMapping:[self bookMapping] forResourcePathPattern:@"/books" withFetchRequestBlock:^NSFetchRequest *(NSString *resourcePath) {
            NSFetchRequest *fetchRequest = [Book fetchRequest];
            return fetchRequest;
        }];
    }
    
    return self;
}

- (RKManagedObjectMapping *)bookMapping {
    RKManagedObjectMapping *mapping = [RKManagedObjectMapping mappingForClass:[Book class] inManagedObjectStore:self.objectStore];
    [mapping setRootKeyPath:@"book"];
    [mapping mapKeyPathsToAttributes:
     @"id", @"bookID",
     @"title", @"bookTitle",
     @"created_at", @"createdAt",
     @"updated_at", @"updatedAt",
     nil];
    
    return mapping;
}


@end
