//
//  IWTabBarController.m
//  weibo2
//
//  Created by 何建新 on 16/8/22.
//  Copyright © 2016年 何建新. All rights reserved.
//

#import "IWTabBarController.h"
#import "IWTabBar.h"
#import "IWHomeViewCtrl.h"
@interface IWTabBarController ()<IWTabBarDelegate>

@end

@implementation IWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    IWTabBar *tabbar = [[IWTabBar alloc] init];
    tabbar.delegate = self;
    [self setValue:tabbar forKey:@"tabBar"];
    IWHomeViewCtrl *homeCtrl = [IWHomeViewCtrl new];
    [self addChildViewCtrl:homeCtrl imageName:@"tabbar_home" title:@"首页"];
    
    UITableViewController *messageCtrl = [UITableViewController new];
    [self addChildViewCtrl:messageCtrl imageName:@"tabbar_message_center" title:@"消息"];
    UITableViewController *discoverCtrl = [UITableViewController new];
    [self addChildViewCtrl:discoverCtrl imageName:@"tabbar_discover" title:@"发现"];
    
    UITableViewController *profileCtrl = [UITableViewController new];
    [self addChildViewCtrl:profileCtrl imageName:@"tabbar_profile" title:@"我"];
    
}

//创建按钮方法
-(void)addChildViewCtrl:(UIViewController *)ctrl imageName:(NSString *)imageName title:(NSString *)title{
    ctrl.title = title;
    //设置按钮图片，并imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal取消按钮图片默认颜色渲染
    ctrl.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.tintColor = [UIColor orangeColor];
    //为创建的按钮创建根控制器
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:ctrl];
    [self addChildViewController:navCtrl];
    
}
-(void)tabBar:(IWTabBar *)tabbar plusBtnDidClicked:(UIButton *)btn{
    NSLog(@"这里是父类，执行了子类的代理方法");
}
@end
