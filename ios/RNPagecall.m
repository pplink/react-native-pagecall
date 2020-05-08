#import "RNPagecall.h"
#import "RCTRootView.h"
#import "RCTLog.h"
#import <PageCallSDK/PageCallSDK.h>

@implementation RNPagecall

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

RCT_EXPORT_METHOD(onPageCall) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"onPageCall invoke");

        NSString *strMyID = @"RNPageCallTestID";
        NSString *strRoomID = @"RNPageCallTestRoomID";
        NSString *strServerURL = @"https://pplink.net";

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
            [pageCall callMyID:strMyID roomID:strRoomID serverURL:strServerURL];
        }];
    });
}

RCT_EXPORT_METHOD(onLSA) {
    dispatch_async(dispatch_get_main_queue(), ^{
        RCTLog(@"onLSA invoke");

        NSString *userId = @"";
        NSString *userName = @"host";
        NSString *roomId = @"class101_peter_test";
        NSString *serverURL = @"https://lsa-demo.pplink.net";

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
            [pageCall joinLSA:YES serverURL:serverURL roomID:roomId userID:userId userName:userName];
        }];
    });
}

@end
