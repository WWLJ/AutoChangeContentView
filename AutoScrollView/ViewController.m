//
//  ViewController.m
//  AutoScrollView
//
//  Created by YiTie on 16/4/18.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "ViewController.h"
#import "CFDynamicLabel.h"
#import "AutoChangeTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"fejkwnviwnververver", @"vjkhrwhver huv erver", @"dkhbwjhverv", @"aefiuewnfiuewnfiuwefniuewnfuiewnfiuew", @"afuiqnieqnufwe", nil];
    AutoChangeTextView *textView = [[AutoChangeTextView alloc] initWithFrame:CGRectMake(100, 100, 200, 60)];
    textView.dataSource = array;
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
