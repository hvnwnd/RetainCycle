//
//  TestViewController.h
//  RetainCycle
//
//  Created by Bin Chen on 06/11/2017.
//  Copyright © 2017 Bin Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController

- (instancetype)initWithImage:(UIImage *)image;

@property (nonatomic, copy) void (^presentAction)(void);
@property (nonatomic, copy) void(^cancelAction)(void);
@end
