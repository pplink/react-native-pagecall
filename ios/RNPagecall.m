#import "RNPagecall.h"
#import "RCTRootView.h"
#import "RCTLog.h"
#import <PageCallSDK/PageCallSDK.h>

@implementation RNPagecall

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startPageCallWithUrl:(NSString *)requestUrl publicRoomId:(NSString *)publicRoomId query:(NSString *)query) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"startPageCallWithURL:%@, publicRoomId:%@, query:%@", requestUrl, publicRoomId, query);
        
        PageCall *pageCall = [PageCall sharedInstance];
        //[pageCall setDelegate:self];

//        #if DEBUG
//        #else
//        [pageCall redirectLogToDocumentsWithTimeInterval:4];
//        #endif
        pageCall.mainViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;

        UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
        while (rootViewController.presentedViewController != nil) {
            rootViewController = rootViewController.presentedViewController;
        }

        [rootViewController presentViewController:pageCall.mainViewController animated:YES completion:^{
            [pageCall call:requestUrl publicRoomId:publicRoomId query:query];
        }];
    });
}

//RCT_EXPORT_METHOD(startLiveStreamingWithURL:(NSString *)serverURL isHost:(BOOL)isHost roomID:(NSString *)roomID userID:(NSString *)userID userName:(NSString *)userName) {
RCT_EXPORT_METHOD(startLiveStreamingWithURL:(NSString *)serverURL) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"startLiveStreamingWithURL:%@", serverURL);

        PageCall *pageCall = [PageCall sharedInstance];
        //[pageCall setDelegate:self];
        
        pageCall.mainViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
        while (rootViewController.presentedViewController != nil) {
            rootViewController = rootViewController.presentedViewController;
        }

        [rootViewController presentViewController:pageCall.mainViewController animated:YES completion:^{
            [pageCall liveStreamingWithURL:serverURL];
        }];
    });
}

@end
