//
//  ImageViewController.m
//  MyDemo
//
//  Created by ShanCheli on 16/10/19.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "ImageViewController.h"
#import "AFNetworking.h"

#import "AFNetworkReachabilityManager.h"

#import "UIImageView+WebCache.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

///////////////////////////////******************第一种解决方案**************************/////////////////////////////////////////////

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 监控网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    return YES;
}


// 利用MVC，在设置cell的模型属性时候，下载图片
- (void)setItem:(id)item {
    
    UIImageView *iamgeView = [[UIImageView alloc] init];
    UIImage *placeholder = [UIImage imageNamed:@"placeholderImage"];

    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    if (mgr.isReachableViaWiFi) { // 在使用Wifi, 下载原图
        [iamgeView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
    } else { // 其他，下载小图
        [iamgeView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
    }
}


///////////////////////////////******************第二种解决方案**************************/////////////////////////////////////////////


- (void)setRItem:(id)item {
    
    UIImageView *imageView = [[UIImageView alloc] init];

    // 占位图片
    UIImage *placeholder = [UIImage imageNamed:@"placeholderImage"];
    
    // 从内存\沙盒缓存中获得原图
    UIImage *originalImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:@"url"];
    
    if (originalImage) { // 如果内存\沙盒缓存有原图，那么就直接显示原图（不管现在是什么网络状态）
        [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
        
        
        
        
        /***************这个地方如果换成另外一种写法*********************/
        
        imageView.image = originalImage;
        
        /***************这时会出现图片混乱的情况，数据对应不正确*********************/

        /*
        1、 用一个场景来描述一下吧：当用户所处环境WiFi网速不够快(不能立即将图片下载完毕)，而在上述代码，在WiFi环境下又是下载高清大图。所以需要一定的时间来完成下载。而就在此时，用户不愿等，想看看上次打开App时显示的图片，此时用户会滑到处于下面的cell来查看。注意：此时，上面的cell下载图片操作并没有暂停，还在处于下载图片状态中。当用户在查看上次打开App的显示图片时（上次打开App下载完成的图片，SDWebImage会帮我们缓存，不用下载），而正好需要显示上次打开App时的图片的cell是利用tableView重用机制而从缓存池中拿出来的cell，等到处于上面的cell的高清大图已经下载好了的时候，SDWebImage默认做法是，立马把下载好的图片设置给ImageView，所以我们这时候会在底下的显示的cell显示上面的图片，造成数据错乱，这是非常严重的BUG。
         
        2、  那么该如何解决这个棘手的问题呢？
         如果我们能在cell被从缓存池中拿出来使用的时候，将这个cell放入缓存池之前的下载操作移除，那么就不会出现数据错乱了。
         这时候你可能会问我：怎么移除下载操作？下载操作不是SDWebImage帮我们做的吗？
         说的没错，确实是SDWebImage帮我们下载图片的，我们来扒一扒SDWebImage源码，看看他是怎么完成的。
         
         3、我们惊奇的发现，原来SDWebImage在下载图片时，第一件事就是关闭imageView当前的下载操作！
         是不是开始感叹SDWebImage多么神奇了？没错，我们只需要把我们写的那段代码所有的直接访问本地缓存代码利用SDWebImage进行设置就OK了！
         */
        
        
    } else { // 内存\沙盒缓存没有原图
        AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
        
        if (mgr.isReachableViaWiFi) { // 在使用Wifi, 下载原图
            [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
            
        } else if (mgr.isReachableViaWWAN) { // 在使用手机自带网络
            //     用户的配置项假设利用NSUserDefaults存储到了沙盒中
            //    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"alwaysDownloadOriginalImage"];
            //    [[NSUserDefaults standardUserDefaults] synchronize];
            
#warning 从沙盒中读取用户的配置项：在3G\4G环境是否仍然下载原图
            BOOL alwaysDownloadOriginalImage = [[NSUserDefaults standardUserDefaults] boolForKey:@"alwaysDownloadOriginalImage"];
            
            if (alwaysDownloadOriginalImage) { // 下载原图
                [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
                
            } else { // 下载小图
                [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
            }
        } else { // 没有网络
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:@""];
            if (thumbnailImage) { // 内存\沙盒缓存中有小图
                [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholder];
            } else {
                [imageView sd_setImageWithURL:nil placeholderImage:placeholder];
            }
        }
    }
}
@end
