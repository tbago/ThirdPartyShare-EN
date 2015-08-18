//
//  ViewController.m
//  ThirdPartyShareDemo
//
//  Created by tbago on 15/8/18.
//  Copyright (c) 2015年 tbago. All rights reserved.
//

#import "ViewController.h"
#import <ThirdPartyShare/ThirdPartyShareFactory.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)googlePlusButtonClick:(UIButton *)sender {
    ThirdPartyShare *googlePlusShare = [[ThirdPartyShareFactory sharedInstance] createThirdPartySharedInstance:GooglePlus];
    [googlePlusShare sharedMessageWithTitle:@"test title" Description:@"description" thumbnailURL:nil];
}
@end
