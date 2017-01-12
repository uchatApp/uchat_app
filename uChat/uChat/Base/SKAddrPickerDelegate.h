//
//  SKAddrPicker.h
//  uChat
//
//  Created by zj－db0548 on 16/11/3.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedBlock)(NSString *retuValue);

@interface SKAddrPickerDelegate : NSObject <UIPickerViewDelegate,
                                            UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) selectedBlock block;

- (void)setDataArray:(NSArray *)dataArray;


@end
