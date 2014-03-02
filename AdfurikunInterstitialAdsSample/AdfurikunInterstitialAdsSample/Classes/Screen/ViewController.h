//
//  ViewController.h
//  AdfurikunInterstitialAdsSample
//
//  Created by Dolice on 2014/03/02.
//  Copyright (c) 2014年 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <adfurikunsdk/AdfurikunView.h>
#import <adfurikunsdk/AdfurikunWallView.h>
#import <adfurikunsdk/AdfurikunPopupView.h>

@interface ViewController : UIViewController <AdfurikunPopupViewDelegate>

#pragma mark - property
@property (nonatomic, retain) AdfurikunPopupView *adPopupView;

@end
