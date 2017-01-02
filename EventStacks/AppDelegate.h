//
//  AppDelegate.h
//  EventStacks
//
//  Created by Joe Manto on 1/1/17.
//  Copyright © 2017 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

