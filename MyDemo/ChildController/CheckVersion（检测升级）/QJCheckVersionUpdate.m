//
//  QJCheckVersionUpdate.m
//  QJVersionUpdateView
//
//  Created by Justin on 16/3/8.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "QJCheckVersionUpdate.h"
#import "QJVersionUpdateVIew.h"

#define GetUserDefaut [[NSUserDefaults standardUserDefaults] objectForKey:@"VersionUpdateNotice"]
#define OLDVERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APPID  @"111111111"


@implementation QJCheckVersionUpdate{
    
    QJVersionUpdateVIew *versionUpdateView;
}

/**
 *  demo
 */
+ (void)CheckVerion:(UpdateBlock)updateblock
{
    NSString *currentAppStoreVersion = @"5.0.0";
    if ([QJCheckVersionUpdate versionlessthan:[GetUserDefaut isKindOfClass:[NSString class]] && GetUserDefaut ? GetUserDefaut : OLDVERSION Newer:currentAppStoreVersion])
    {
        NSLog(@"暂不更新");
    }else{
        NSLog(@"请到appstore更新%@版本",currentAppStoreVersion);
         NSString *describeStr = @"1.修正了部分单词页面空白的问题修正了部分单词页面空白的问题\n2.修正了部分单词页面空白的问题去够呛够呛\n3.修正了部分单词页面空白的问题";
        NSLog(@"修复问题描述:%@",describeStr);
        NSArray *dataArr = [QJCheckVersionUpdate separateToRow:describeStr];
        if (updateblock) {
            updateblock(currentAppStoreVersion,dataArr);
        }
    }
}

/**
 *  正式
 */

//+ (void)CheckVerion:(UpdateBlock)updateblock
//{
//    NSString *storeString = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?bundleId=%@",OLDVERSION];
//    NSURL *storeURL = [NSURL URLWithString:storeString];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:storeURL];
//    [request setHTTPMethod:@"GET"];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//        if ( [data length] > 0 && !error ) {
//            // Success
//            NSDictionary *appData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                // All versions that have been uploaded to the AppStore
//                NSArray *versionsInAppStore = [[appData valueForKey:@"results"] valueForKey:@"version"];
//                /**
//                 *  以上网络请求可以改成自己封装的类
//                 */
//                if(![versionsInAppStore count]) {
//                    NSLog(@"No versions of app in AppStore");
//                    return;
//                } else {
//                    NSString *currentAppStoreVersion = [versionsInAppStore objectAtIndex:0];
//                    NSLog(@"%@",OLDVERSION);
//                    if ([QJCheckVersionUpdate versionlessthan:[GetUserDefaut isKindOfClass:[NSString class]] && GetUserDefaut ? GetUserDefaut : OLDVERSION Newer:currentAppStoreVersion])
//                    {
//                        NSLog(@"暂不更新");
//                    }else{
//                        NSLog(@"请到appstore更新%@版本",currentAppStoreVersion);
//                        /**
//                         *  修复问题描述
//                         */
//                        NSString *describeStr = [[[appData valueForKey:@"results"] valueForKey:@"releaseNotes"] objectAtIndex:0];
//                        NSLog(@"修复问题描述:%@",describeStr);
//                        NSArray *dataArr = [QJCheckVersionUpdate separateToRow:describeStr];
//                        if (updateblock) {
//                            updateblock(currentAppStoreVersion,dataArr);
//                        }
//                    }
//                }
//                
//            });
//        }
//        
//    }];
//}


+ (BOOL)versionlessthan:(NSString *)oldOne Newer:(NSString *)newver
{
    if ([oldOne isEqualToString:newver]) {
        return YES;
    }else{
        if ([oldOne compare:newver options:NSNumericSearch] == NSOrderedDescending)
        {
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}


+ (NSArray *)separateToRow:(NSString *)describe
{
    NSArray *array= [describe componentsSeparatedByString:@"\n"];
    return array;
}

- (void)showAlertView
{
    __weak typeof(self) weakself = self;
    [QJCheckVersionUpdate CheckVerion:^(NSString *str, NSArray *DataArr) {
        if (!versionUpdateView) {
            versionUpdateView = [[QJVersionUpdateVIew alloc] initWith:[NSString stringWithFormat:@"版本:%@",str] Describe:DataArr];
            versionUpdateView.GoTOAppstoreBlock = ^{
                [weakself goToAppStore];
            };
            versionUpdateView.removeUpdateViewBlock = ^{
                [weakself removeVersionUpdateView];
            };
            [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"VersionUpdateNotice"];
        }
    }];
}

- (void)removeVersionUpdateView
{
    [versionUpdateView removeFromSuperview];
    versionUpdateView = nil;
}

- (void)goToAppStore
{
    NSString *urlStr = [self getAppStroeUrlForiPhone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}

-(NSString *)getAppStroeUrlForiPhone{
    return [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/%@",APPID];
}

@end
