//
//  UIAlertController+Category.h
//  uChat
//
//  Created by zj－db0548 on 16/10/16.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Category)

+ (void)UIViewController:(UIViewController *)controller
         alterWithTitile:(NSString *)title
                 message:(NSString *)message
              cacelTitle:(NSString *)cacelTitle;
@end
