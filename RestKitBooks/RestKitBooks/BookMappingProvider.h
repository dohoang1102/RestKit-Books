//
//  BookMappingBrovider.h
//  RestKitBooks
//
//  Created by John Ryan on 7/31/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import "RKObjectMappingProvider.h"
#import <RestKit/RestKit.h>

@interface BookMappingProvider : RKObjectMappingProvider

@property (nonatomic, retain) RKManagedObjectStore *objectStore;

+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore;

- (id)initWithObjectStore:(RKManagedObjectStore *)objectStore;

- (RKManagedObjectMapping *)bookMapping;

@end
