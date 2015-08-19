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
//  GooglePlus.m
//  ThirdPartyShare
//
//  Created by tbago on 15/8/17.
//

#import "GooglePlusShare.h"
#import <GooglePlus/GPPShare.h>
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GTLPlusConstants.h>

@interface GooglePlusShare() <GPPSignInDelegate>
@end

@implementation GooglePlusShare

- (void)sharedImage:(UIImage *) image
        prefillText:(NSString *) prefillText {
//    GPPSignIn *signIn = [GPPSignIn sharedInstance];
//    [signIn signOut];
//    if (![signIn authentication]) {
//        signIn.delegate = self;
//        signIn.scopes = [NSArray arrayWithObjects:
//                         kGTLAuthScopePlusLogin, // 在 GTLPlusConstants.h 中定义
//                         nil];
//        [signIn authenticate];
//    }
    id<GPPNativeShareBuilder> shareBuilder = [[GPPShare sharedInstance] nativeShareDialog];

    [shareBuilder setPrefillText:prefillText];
    [shareBuilder attachImage:image];
    [shareBuilder open];
}

#pragma mark - GPPSignInDelegate
- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if (error) {
        // 在此处执行某些错误处理。
    } else {
    }
}

@end
