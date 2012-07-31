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
#import "BookMappingProvider.h"

@interface AppDelegate ()
@property (nonatomic, strong, readwrite) RKObjectManager *objectManager;
@property (nonatomic, strong, readwrite) RKManagedObjectStore *objectStore;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize objectManager;
@synthesize objectStore;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initializeRestKit];
    
    return YES;
}

- (void)initializeRestKit
{
    self.objectManager = [RKObjectManager managerWithBaseURLString:@"http://localhost:3000"];
    self.objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:@"RestKitBooks.sqlite"];
    self.objectManager.objectStore = self.objectStore;
    self.objectManager.mappingProvider = [BookMappingProvider mappingProviderWithObjectStore:self.objectStore];
}

@end
