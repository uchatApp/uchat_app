//
//  UIAlertController+Category.m
//  uChat
//
//  Created by zj－db0548 on 16/10/16.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "UIAlertController+Category.h"

@implementation UIAlertController(Category)

+ (void)UIViewController:(UIViewController *)controller
         alterWithTitile:(NSString *)title
                 message:(NSString *)message
              cacelTitle:(NSString *)cacelTitle; {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cacelTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                             
                                                         }];
    [alert addAction:cancelAction];
    [controller presentViewController:alert
                       animated:NO
                     completion:nil];

}

@end
