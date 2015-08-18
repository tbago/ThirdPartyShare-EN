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
//  ThirdPartyShareFactory.m
//  ThirdPartyShare
//
//  Created by tbago on 15/8/17.
//

#import "ThirdPartyShareFactory.h"
#import "GooglePlusShare.h"
#import "FacebookShare.h"

@implementation ThirdPartyShareFactory

+ (instancetype)sharedInstance {
    static ThirdPartyShareFactory *sInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[ThirdPartyShareFactory alloc] init];
    });
    return sInstance;
}

- (ThirdPartyShare *)createThirdPartySharedInstance:(SharedType) sharedType {
    switch (sharedType) {
        case GooglePlus:
            return [[GooglePlusShare alloc] init];
            break;
        case Facebook:
            return [[FacebookShare alloc] init];
            break;
        default:
            return nil;
            break;
    }
}
@end
