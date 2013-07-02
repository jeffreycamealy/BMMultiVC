//
//  BMMultiVC.m
//  BMMultiVC
//
//  Created by Jeffrey Camealy on 7/2/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMMultiVC.h"


@implementation BMMultiVC

#pragma mark - Public API

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [self removeCurrentVC];
    _selectedIndex = selectedIndex;
    [self addCurrentVC];
}


#pragma mark - Private API

- (void)removeCurrentVC {
    UIViewController *currentVC = self.viewControllers[self.selectedIndex];
    [currentVC willMoveToParentViewController:nil];
    [currentVC.view removeFromSuperview];
    [currentVC removeFromParentViewController];
}

- (void)addCurrentVC {
    UIViewController *currentVC = self.viewControllers[self.selectedIndex];
    [self addChildViewController:currentVC];
    [self.view addSubview:currentVC.view];
    currentVC.view.frame = self.view.bounds;
    [currentVC didMoveToParentViewController:self];
}


@end
