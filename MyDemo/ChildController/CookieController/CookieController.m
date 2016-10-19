//
//  CookieController.m
//  MyDemo
//
//  Created by ShanCheli on 16/10/19.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "CookieController.h"
#import "AFNetworking.h"

@interface CookieController ()

@end

@implementation CookieController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self getAndSaveCookie];
}

#pragma mark 获取并保存cookie到userDefaults
- (void)getAndSaveCookie
{
    NSLog(@"=============获取cookie==============");
    NSString *urlString = @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //请求一个网址，即可分配到cookie
    [manager GET:urlString parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //获取cookie
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        for (NSHTTPCookie *tempCookie in cookies) {
            //打印获得的cookie
            NSLog(@"getCookie: %@", tempCookie);
        }
        
        /*
         * 把cookie进行归档并转换为NSData类型
         * 注意：cookie不能直接转换为NSData类型，否则会引起崩溃。
         * 所以先进行归档处理，再转换为Data
         */
        NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
        
        //存储归档后的cookie
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject: cookiesData forKey: @"cookie"];
        NSLog(@"\n");
        
        [self deleteCookie];
        
        [self setCoookie];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

    }];
    
}

#pragma mark 删除cookie
- (void)deleteCookie
{
    NSLog(@"============删除cookie===============");
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    
    //删除cookie
    for (NSHTTPCookie *tempCookie in cookies) {
        [cookieStorage deleteCookie:tempCookie];
    }
    
    //把cookie打印出来，检测是否已经删除
    NSArray *cookiesAfterDelete = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *tempCookie in cookiesAfterDelete) {
        NSLog(@"cookieAfterDelete: %@", tempCookie);
    }
    NSLog(@"\n");
}

#pragma mark 再取出保存的cookie重新设置cookie
- (void)setCoookie
{
    NSLog(@"============再取出保存的cookie重新设置cookie===============");
    //取出保存的cookie
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //对取出的cookie进行反归档处理
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"cookie"]];
    
    if (cookies) {
        NSLog(@"有cookie");
        //设置cookie
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (id cookie in cookies) {
            [cookieStorage setCookie:(NSHTTPCookie *)cookie];
        }
    }else{
        NSLog(@"无cookie");
    }
    
    //打印cookie，检测是否成功设置了cookie
    NSArray *cookiesA = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookiesA) {
        NSLog(@"setCookie: %@", cookie);
    }
    NSLog(@"\n");
}

///////////////////////////////另一只理解方式//////////////////////////////////////////////////////

//UIWebview中设置Cookie,有时候设置Cookie的参数根据后台的要求而不同，我这里设置的参数是userID和userPass，即用户ID和密码

-(void)setUIWebviewcookie{
    NSString * strID = [NSString stringWithFormat:@"%@",@"id"];
    NSURL *cookieHost = [NSURL URLWithString:@"http://www.xxx.com"];
    // 设定 cookie
    NSHTTPCookie *cookie1 = [NSHTTPCookie cookieWithProperties:
                             [NSDictionary dictionaryWithObjectsAndKeys:
                              [cookieHost host], NSHTTPCookieDomain,
                              [cookieHost path], NSHTTPCookiePath,
                              @"USER_ID",  NSHTTPCookieName,
                              strID, NSHTTPCookieValue,
                              nil]];
    
    // 设定 cookie
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie1];
    NSString * mdStr = @"mima";
    // 定义 cookie 要设定的 host
    // 设定 cookie
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             [cookieHost host], NSHTTPCookieDomain,
                             [cookieHost path], NSHTTPCookiePath,
                             @"USER_PASS",  NSHTTPCookieName,
                             mdStr, NSHTTPCookieValue,
                             nil]];
    // 设定 cookie
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
}
/**
 *  网络请求设置Cookie
 */
-(void)setCookie{
    
    NSString * cookStr = [NSString stringWithFormat:@"这是字符串是后台要求的"];
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:@"author" forKey:NSHTTPCookieName];
    [cookieProperties setObject:cookStr forKey:NSHTTPCookieValue];
    [cookieProperties setObject:@"www.xxx.com" forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:@"baseUrl 是一个url" forKey:NSHTTPCookieOriginURL];
    [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
    [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
    [cookieProperties setValue:[NSDate dateWithTimeIntervalSinceNow:60*60*24*360] forKey:NSHTTPCookieExpires];
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}
/**
 *  清除Cookie
 */
-(void)clearCook{
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *_tmpArray = [NSArray arrayWithArray:[cookieJar cookies]];
    for (id obj in _tmpArray) {
        [cookieJar deleteCookie:obj];
    }
}


@end
