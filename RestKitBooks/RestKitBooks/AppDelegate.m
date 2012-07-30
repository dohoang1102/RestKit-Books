//
//  AppDelegate.m
//  RestKitBooks
//
//  Created by John Ryan on 7/27/12.
//  Copyright (c) 2012 Arturia. All rights reserved.
//

#import "AppDelegate.h"
#import "RestKit.h"
#import "CoreData.h"
#import "Book.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Enable Logging
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURLString:@"http://localhost:3000"];
    
    /*
     * Set up the object mapping provider.  This is a singleton that can always be accessed with
     * [[RKObjectManager sharedManager] mappingProvider]
     */
    RKObjectMappingProvider *objectMappingProvider = [[RKObjectMappingProvider alloc] init];

    [[RKObjectManager sharedManager] setMappingProvider:objectMappingProvider];
    
    /*
     * Tell RestKit about our database; i.e. 'object store'
     */
    RKManagedObjectStore *objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:@"RestKitBooks.sqlite"];
    [objectManager setObjectStore:objectStore];
    
    RKObjectMapping *bookMapping = [RKManagedObjectMapping mappingForClass:[Book class] inManagedObjectStore:objectStore];
    [bookMapping setRootKeyPath:@"book"];
    [bookMapping mapKeyPathsToAttributes:
    @"id", @"bookID",
    @"title", @"bookTitle",
    nil];
    
//    [objectManager.mappingProvider setMapping:bookMapping forKeyPath:@"books"];
    [objectManager.mappingProvider setObjectMapping:bookMapping forKeyPath:@"book"];
    [RKObjectManager setSharedManager:objectManager];


    
    return YES;
}


@end
