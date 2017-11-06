//
//  TestViewController.m
//  RetainCycle
//
//  Created by Bin Chen on 06/11/2017.
//  Copyright © 2017 Bin Chen. All rights reserved.
//

#import "TestViewController.h"
#import "TestPresentationController.h"

@interface TestViewController () <UIViewControllerTransitioningDelegate>
@property (nonatomic) UIImage *image;
@property (nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation TestViewController

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        NSLog(@"init %@", self);
        _image = image;
        
//        self.modalPresentationStyle = UIModalPresentationCustom;
//        self.transitioningDelegate = self;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = self.image;
}

- (void)dealloc
{
    NSLog(@"dealloc %@", self);
}

- (IBAction)dismiss:(id)sender{
    if (self.cancelAction){
        self.cancelAction();
    }else{
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
}

- (IBAction)presentAnother:(id)sender
{
    if (self.presentAction){
        self.presentAction();
    }
}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
//{
//    return [[TestPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
//}

@end
