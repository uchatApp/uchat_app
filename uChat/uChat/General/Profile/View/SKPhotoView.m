//
//  SKPhotoView.m
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKPhotoView.h"

#import "UIView+Utils.h"

@interface SKPhotoView ()

@property (nonatomic, strong) NSMutableArray *imageViewArray;
@property (nonatomic, assign) CGFloat imageViewHeight;

@end


@implementation SKPhotoView

- (instancetype)init {

    self = [super init];
    _imageViewArray = [[NSMutableArray alloc] init];
    _imageViewHeight = (MTScreenWidth - 30) / 4.0;
    if (self) {
        
        for (int i = 0; i < 8; i ++) {
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake((_imageViewHeight + 10)* (i % 4),
                                         (_imageViewHeight + 10) * (i / 4),
                                         _imageViewHeight,
                                         _imageViewHeight);
            [_imageViewArray addObject:imageView];
        }
    }
    return self;
}

- (instancetype)initWithImageArray:(NSArray *)array {
    
    self = [self init];
    if (self) {
        for (int i = 0; i < array.count; i ++) {
            UIImageView *view = [_imageViewArray objectAtIndex:i];
            view.image = [UIImage imageNamed:[array objectAtIndex:i]];
            [self addSubview: view];
        }
    }
    
    return self;
}

+ (CGFloat)viewHeight {

    return (MTScreenWidth - 30) / 4.0 * 2 + 10;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_editAble) {
        
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (_editAble) {
        
    }

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (!_editAble) {
        self.userInteractionEnabled = NO;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_editAble) {
        
    }

}

- (void)setEditAble:(BOOL)editAble {

    _editAble = editAble;
    
}

@end



