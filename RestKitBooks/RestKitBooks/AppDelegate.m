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
    
    RKObjectManager* objectManager = [RKObjectManager managerWithBaseURLString:@"http://localhost:3000/"];

    RKObjectMapping *bookMapping = [RKObjectMapping mappingForClass:[Book class]];
    [bookMapping setRootKeyPath:@"book"];
    [bookMapping mapKeyPathsToAttributes:
    @"id", @"bookID",
    @"title", @"bookTitle",
    nil];
    
    [objectManager.mappingProvider setObjectMapping:bookMapping forKeyPath:@"book"];
    
    return YES;
}


@end
