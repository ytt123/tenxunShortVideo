//
//  AppDelegate.m
//  腾讯短视频
//
//  Created by yangtaotao on 2021/5/29.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HUDHelper.h"

#import "TCMainViewController.h"
#import "TCLoginViewController.h"
#import "TCUtil.h"



@import TXLiteAVSDK_UGC;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSString * const licenceURL = @"http://license.vod2.myqcloud.com/license/v1/c98338cc71784986addacef5278c2e00/TXUgcSDK.licence";
    NSString * const licenceKey = @"d6ada49aa26bc9923593b75a6c14a407";
    [TXUGCBase setLicenceURL:licenceURL key:licenceKey];
//    [TXLiveBase setConsoleEnabled:NO];
//    [TXLiveBase setLogLevel:LOGLEVEL_DEBUG];
    NSLog(@"SDK Version = %@", [TXLiveBase getSDKVersionStr]);
    
    //常规设置
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    TCMainViewController *mainController = [[TCMainViewController alloc] init];
    mainController.loginHandler = ^(TCMainViewController *_) {
        [self showLoginUI];
    };
    [HUDHelper sharedInstance].keyWindow = self.window;
    self.window.rootViewController=mainController;
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (void)showLoginUI {
    TCLoginViewController *loginViewController = [[TCLoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self.window.rootViewController presentViewController:nav animated:YES completion:nil];
}



@end
