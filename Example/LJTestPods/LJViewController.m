//
//  LJViewController.m
//  LJTestPods
//
//  Created by dabaosodmi0420 on 04/04/2019.
//  Copyright (c) 2019 dabaosodmi0420. All rights reserved.
//

#import "LJViewController.h"
#import "JTLoadingView.h"
@interface LJViewController ()

@end

@implementation LJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [JTLoadingView jt_loadingShow:self.view];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
