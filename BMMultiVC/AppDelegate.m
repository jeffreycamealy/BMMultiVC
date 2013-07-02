//
//  AppDelegate.m
//  BMMultiVC
//
//  Created by Jeffrey Camealy on 7/2/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "AppDelegate.h"
#import "BMMultiVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupWindow];
    [self setupRootVC];
    return YES;
}

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
}

- (void)setupRootVC {
    BMMultiVC *multiVC = BMMultiVC.new;
    
    UIViewController *vc1 = UIViewController.new;
    vc1.view.backgroundColor = UIColor.blueColor;
    
    UIViewController *vc2 = UIViewController.new;
    vc2.view.backgroundColor = UIColor.redColor;
    
    multiVC.viewControllers = @[vc1, vc2];
    multiVC.selectedIndex = 0;
    
    self.window.rootViewController = multiVC;
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        multiVC.selectedIndex = 1;
    });
}

@end
