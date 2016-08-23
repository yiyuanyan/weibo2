//
//  IWTabBar.m
//  weibo2
//
//  Created by 何建新 on 16/8/22.
//  Copyright © 2016年 何建新. All rights reserved.
//

#import "IWTabBar.h"

@interface IWTabBar()
//加号按钮
@property(nonatomic, weak)UIButton *plusBtn;
@end

@implementation IWTabBar
//因为IWTabBarDelegate要在父类中实现，所以要设置不在本类中实现
@dynamic delegate;
//按钮初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //创建一个按钮
        UIButton *plusBtn = [UIButton new];
        //设置按钮不同状态
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        //添加按钮点击事件
        [plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //设置按钮的大小为背景图片的大小
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}
//调节按钮位置
-(void)layoutSubviews{
    [super layoutSubviews];
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    CGFloat tabbarBtnW = self.width * 0.2;
    NSInteger index = 0;
    for(int i = 0; i<self.subviews.count;i++){
        UIView *view = self.subviews[i];
        if([view isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            view.width = tabbarBtnW;
            view.x = index * tabbarBtnW;
            if(index == 1){
                index++;
            }
            index++;
        }
    }
}
-(void)plusBtnClick:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(tabBar:plusBtnDidClicked:)]){
        [self.delegate tabBar:self plusBtnDidClicked:btn];
    }
}
@end
