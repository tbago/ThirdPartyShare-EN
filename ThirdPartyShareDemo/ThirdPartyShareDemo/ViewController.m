//
//  Copyright (C) 2015 tbago.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//
//
//  ViewController.m
//  ThirdPartyShareDemo
//
//  Created by tbago on 15/8/18.
//

#import "ViewController.h"
#import "GooglePlusShare.h"
#import "FacebookShare.h"

#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GTLPlusConstants.h>

@interface ViewController () <GPPSignInDelegate>

@property (weak, nonatomic) IBOutlet UIView *facebookBackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)googlePlusButtonClick:(UIButton *)sender {
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.delegate = self;
    if (![signIn authentication]) {
        signIn.shouldFetchGooglePlusUser = YES;
        signIn.scopes = [NSArray arrayWithObjects:
                         kGTLAuthScopePlusLogin, // 在 GTLPlusConstants.h 中定义
                         nil];
        [signIn authenticate];
    }
}

- (IBAction)facebookButtonClick:(UIButton *)sender {
    FacebookShare *facebookShare = [[FacebookShare alloc] init];
    [facebookShare sharedImage:[UIImage imageNamed:@"facebook_share"]
            fromViewController:self];
}

- (IBAction)instagramButtonClick:(UIButton *)sender {

}

#pragma mark - GPPSignInDelegate
- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if (error) {
        // 在此处执行某些错误处理。
    } else {
        GooglePlusShare *googlePlusShare = [[GooglePlusShare alloc] init];
        [googlePlusShare sharedImage:[UIImage imageNamed:@"facebook_share"] prefillText:@"test google share"];
    }
}
@end
