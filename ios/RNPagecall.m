#import "RNPagecall.h"
#import "RCTRootView.h"
#import "RCTLog.h"
#import <PageCallSDK/PageCallSDK.h>

@implementation RNPagecall

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startPageCallWithURL:(NSString *)serverURL roomID:(NSString *)roomID myID:(NSString *)myID) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"startPageCallWithURL:%@, roomID:%@, myID:%@", serverURL, roomID, myID);

        PageCall *pageCall = [PageCall sharedInstance];
        //[pageCall setDelegate:self];

        #if DEBUG
        #else
        [pageCall redirectLogToDocumentsWithInterval:1];
        #endif
        pageCall.mainViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;

        UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
        while (rootViewController.presentedViewController != nil) {
            rootViewController = rootViewController.presentedViewController;
        }

        [rootViewController presentViewController:pageCall.mainViewController animated:YES completion:^{
            [pageCall callMyID:myID roomID:roomID serverURL:serverURL appName:nil template:nil];
        }];
    });
}

//RCT_EXPORT_METHOD(startLiveStreamingWithURL:(NSString *)serverURL isHost:(BOOL)isHost roomID:(NSString *)roomID userID:(NSString *)userID userName:(NSString *)userName) {
RCT_EXPORT_METHOD(startLiveStreamingWithURL:(NSString *)serverURL) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"startLiveStreamingWithURL:%@", serverURL);

        PageCall *pageCall = [PageCall sharedInstance];
        //[pageCall setDelegate:self];

        #if DEBUG
        #else
        //[pageCall redirectLogToDocumentsWithRoomCount:3];
        #endif
        
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
