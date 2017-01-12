//
//  SKPhotoView.h
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  SKPhotoView : UIView

@property (nonatomic, assign) BOOL editAble;

+ (CGFloat)viewHeight;
- (instancetype)initWithImageArray:(NSArray *)array;


@end
