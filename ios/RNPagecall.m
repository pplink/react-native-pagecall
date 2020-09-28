#import "RNPagecall.h"
#import "RCTRootView.h"
#import "RCTLog.h"
#import <PageCallSDK/PageCallSDK.h>

@implementation RNPagecall

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(call:(NSString *)requestUrl publicRoomId:(NSString *)publicRoomId query:(NSString *)query) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"RNPagecall | call requestUrl:%@, publicRoomId:%@, query:%@", requestUrl, publicRoomId, query);
        
        PageCall *pageCall = [PageCall sharedInstance];
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

RCT_EXPORT_METHOD(connectIn:(NSDictionary *)pcaInfo roomData:(NSDictionary *)roomData userData:(NSDictionary *)userData template:(NSDictionary *)template) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"RNPagecall | connectIn pcaInfo:%@", pcaInfo);
        
        PageCall *pageCall = [PageCall sharedInstance];
        pageCall.mainViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
        while (rootViewController.presentedViewController != nil) {
            rootViewController = rootViewController.presentedViewController;
        }

        [rootViewController presentViewController:pageCall.mainViewController animated:YES completion:^{
            [pageCall connectIn:pcaInfo roomData:roomData userData:userData template:template];
        }];
    });
}

RCT_EXPORT_METHOD(loadHTMLString:(NSString *)htmlString) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"RNPagecall | loadHTMLString=%@", htmlString);
        
        PageCall *pageCall = [PageCall sharedInstance];
        pageCall.mainViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
        while (rootViewController.presentedViewController != nil) {
            rootViewController = rootViewController.presentedViewController;
        }

        [rootViewController presentViewController:pageCall.mainViewController animated:YES completion:^{
            [pageCall loadHTMLString:htmlString];
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
        // enable log
        //[pageCall redirectLogToDocumentsWithRoomCount:3];
        [pageCall redirectLogToDocumentsWithTimeInterval:4];
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
