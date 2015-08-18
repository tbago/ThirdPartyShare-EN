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
#import <ThirdPartyShare/ThirdPartyShareFactory.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *facebookBackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = [UIImage imageNamed:@"facebook_share"];
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    [FBSDKShareAPI shareWithContent:content delegate:nil];
    
    FBSDKShareButton *button = [[FBSDKShareButton alloc] initWithFrame:self.facebookBackView.frame];
    button.shareContent = content;
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)googlePlusButtonClick:(UIButton *)sender {
//    ThirdPartyShare *googlePlusShare = [[ThirdPartyShareFactory sharedInstance] createThirdPartySharedInstance:GooglePlus];
//    [googlePlusShare sharedMessageWithTitle:@"test title" Description:@"description" thumbnailURL:nil];
}

- (IBAction)facebookButtonClick:(UIButton *)sender {
    FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
    dialog.fromViewController = self;
    
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = [UIImage imageNamed:@"facebook_share"];
    photo.userGenerated = YES;
    photo.caption = @"Haha";
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    dialog.shareContent = content;
    dialog.mode = FBSDKShareDialogModeShareSheet;
    [dialog show];
}
@end
