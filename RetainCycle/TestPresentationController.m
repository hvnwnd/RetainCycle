//
//  TestPresentationController.m
//  RetainCycle
//
//  Created by Bin Chen on 06/11/2017.
//  Copyright © 2017 Bin Chen. All rights reserved.
//

#import "TestPresentationController.h"

@interface TestPresentationController()<UIAdaptivePresentationControllerDelegate>

@end
@implementation TestPresentationController

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection{
    return UIModalPresentationOverFullScreen;
}
- (nullable UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style
{
    return [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
}

@end
