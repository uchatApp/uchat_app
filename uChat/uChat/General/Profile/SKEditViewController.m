//
//  SKEditViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/11/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKEditViewController.h"

#import "UIView+Utils.h"


@interface SKEditViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *eidtView;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, assign) BOOL isSaved;

@end


@implementation SKEditViewController


- (instancetype)initWithType:(EditViewControllerType) type{
    
    self = [super init];
    
    if (self) {
        _type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = _editTitle;
    _isSaved = NO;
    _saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                             0,
                                                             40,
                                                             40)];
    _saveButton.backgroundColor = [UIColor yellowColor];
    [_saveButton setTitle:@"save" forState:UIControlStateNormal];
    [_saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                             0,
                                                             40,
                                                             40)];
    [_backButton setTitle:@"back" forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:_saveButton];
    
    self.navigationItem.rightBarButtonItem = item;
    [self layoutWithType:_type];

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    
    
}

- (void)dealloc {
}

- (void)layoutWithType:(EditViewControllerType) type{

    switch (type) {
        case EditViewControllerTypeText:
        {
            CGRect rect = CGRectMake(0,
                                      64 + 15,
                                      MTScreenWidth,
                                      200);
            _textView = [[UITextView alloc] initWithFrame:rect];
            _textView.backgroundColor = [UIColor grayColor];
            _textView.delegate = self;
            [self.view addSubview:_textView];
            
        }
            break;
            
        case EditViewControllerTypeDatePicker:
        {
            
        }
            break;

        case EditViewControllerTypeAddressPicker:
        {
            
        }
            break;

            
        default:
            break;
    }
}

- (void)save {
    _value = _textView.text;
    _isSaved = YES;
}

- (void)back {
    
    //是否保存修改
    if (_isSaved) {
        [self.navigationController popViewControllerAnimated:NO];
        if ([_delegate respondsToSelector:@selector(processWithTitle:andValue:)]) {
            [_delegate processWithTitle:_editTitle andValue:@"value"];
        }

    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                       message:@"是否保存修改" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"否"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *acion){
                                                                 [self.navigationController popViewControllerAnimated:NO];
                                                             
                                                             }];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"是"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *acion){
                                                                 [self.navigationController popViewControllerAnimated:NO];
                                                                 if ([_delegate respondsToSelector:@selector(processWithTitle:andValue:)]) {
                                                                     [_delegate processWithTitle:_editTitle andValue:@"value"];
                                                                 }

                                                                 
                                                             }];
        [alert addAction:confirmAction];
        [alert addAction:cancelAction];
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    _isSaved = NO;
}

@end
