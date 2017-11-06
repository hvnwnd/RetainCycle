//
//  ViewController.m
//  RetainCycle
//
//  Created by Bin Chen on 06/11/2017.
//  Copyright © 2017 Bin Chen. All rights reserved.

/*
 Self不能present两次， 否则Attempt to present <TestViewController: 0x7fcc16c12360> on <ViewController: 0x7fcc16d08d40> whose view is not in the window hierarchy
 
 Strongify 不必要
 
 谁的block里引用自己， 谁weakify
 dispatch需要weakify
 
 */

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()
@property (nonatomic) NSArray *images;
@end

@implementation ViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.images = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"], [UIImage imageNamed:@"4"], nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test:(id)sender{
    TestViewController *t1 = [[TestViewController alloc] initWithImage:self.images[0]];
    __weak typeof (t1) weakT1 = t1;
    t1.presentAction = ^(void){
        // Not necessary:       __strong typeof (weakT1) strongT1 = weakT1;
        
        TestViewController *t2 = [[TestViewController alloc] initWithImage:self.images[1]];
        __weak typeof (t2) weakT2 = t2;
        t2.presentAction = ^{
            TestViewController *t3 = [[TestViewController alloc] initWithImage:self.images[2]];
            t3.cancelAction = ^{
                [self dismissViewControllerAnimated:YES completion:^{
                    TestViewController *t4 = [[TestViewController alloc] initWithImage:self.images[3]];
                    NSLog(@"test %@", self);
                    [self presentViewController:t4 animated:YES completion:NULL];
                }];
            };
            [weakT2.navigationController pushViewController:t3 animated:YES];
            //[weakT2 presentViewController:t3 animated:YES completion:NULL];
            
        };
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:t2];
        [weakT1 presentViewController:nvc animated:YES completion:NULL];
    };
    [self presentViewController:t1 animated:YES completion:NULL];
}


@end
