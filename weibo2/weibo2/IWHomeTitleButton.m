//
//  IWHomeTitleButton.m
//  weibo2
//
//  Created by 何建新 on 16/8/22.
//  Copyright © 2016年 何建新. All rights reserved.
//

#import "IWHomeTitleButton.h"

@implementation IWHomeTitleButton

-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
    self.width = CGRectGetMaxX(self.imageView.frame) + 5;
    self.centerX = self.superview.centerX;
}

@end
