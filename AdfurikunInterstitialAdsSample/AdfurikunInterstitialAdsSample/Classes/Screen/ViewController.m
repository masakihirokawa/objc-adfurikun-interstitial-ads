//
//  ViewController.m
//  AdfurikunInterstitialAdsSample
//
//  Created by Dolice on 2014/03/02.
//  Copyright (c) 2014年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // アドフリくんのインターステシャル広告読み込み
    [self setAdfurikunIntersAd];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // アドフリくんのインターステシャル広告削除
    [self removeAdfurikunIntersAd];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // アドフリくん: インターステシャル広告を最前面に配置
    [self insertAdfurikunIntersAd];
}

#pragma mark - Adfurikun Interstitial Ads

// アドフリくんのインターステシャル広告読み込み
- (void)setAdfurikunIntersAd
{
    _adPopupView = [[AdfurikunPopupView alloc] init];
    _adPopupView.delegate = self;
    _adPopupView.appId = @"53089226bb323cc56d000010";
    
    // テストモード
    //[_adPopupView testModeEnable];
    
    // 表示頻度の設定 n回に1回 表示
    [_adPopupView setSchedule:1];
    
    // アプリの起動時に最大表示回数を設定する場合には生成時に初期化
    [_adPopupView setDisplayCount:0];
    
    // 最大表示回数
    //[_adPopupView setMaxDisplay:1];
    
    // 画面に追加
    [self.view addSubview:_adPopupView];
    
    // 広告読み込み
    [_adPopupView startShowAd];
}

// アドフリくんのインターステシャル広告削除
- (void)removeAdfurikunIntersAd
{
    [_adPopupView removeFromSuperview];
    if (_adPopupView != NULL) {
        _adPopupView = NULL;
    }
}

// アドフリくんのインターステシャル広告を最前面に配置
- (void)insertAdfurikunIntersAd
{
    [self.view insertSubview:_adPopupView aboveSubview:self.view];
}

// アドフリくんが閉じられた時のデリゲートメソッド
- (void)adfurikunViewAdClose:(AdfurikunPopupView *)view
{
    // 閉じられたら次の広告を読み込み
    if (view.closeType == AdfurikunPopUpCloseTypeTouchUpButton || view.closeType == AdfurikunPopUpCloseTypeScheduleSkip) {
        [_adPopupView preloadAd];
    }
}

@end
