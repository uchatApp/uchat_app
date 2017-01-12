//
//  SKEditViewController.h
//  uChat
//
//  Created by zj－db0548 on 16/11/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EditViewControllerType) {
    EditViewControllerTypeText,
    EditViewControllerTypeDatePicker,
    EditViewControllerTypeAddressPicker,
};

@protocol EditViewControllerDelegate <NSObject>

- (void)valueChanged:(NSString *)value;
- (void)processWithTitle:(NSString *)title andValue:(NSString *)value;

@end

@interface SKEditViewController : UIViewController

@property (nonatomic, assign) EditViewControllerType type;
@property (nonatomic, copy) NSString *editTitle;
@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;


@end
