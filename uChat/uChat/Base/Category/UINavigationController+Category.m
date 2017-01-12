//
//  UINavigationController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController(Category)

- (void)rightButtonItemWithCustomView:(UIView *)view {

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)leftButtonItemWithCustomView:(UIView *)view {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = item;

}
- (void)titleViewWithCustomView:(UIView *)view {
    
     self.navigationItem.titleView = view;
}


@end
