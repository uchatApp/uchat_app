//
//  UINavigationController+category.h
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UINavigationController (Category)

- (void)rightButtonItemWithCustomView:(UIView *)view;
- (void)leftButtonItemWithCustomView:(UIView *)view;
- (void)titleViewWithCustomView:(UIView *)view;

@end
