//
//  SKAddrPicker.m
//  uChat
//
//  Created by zj－db0548 on 16/11/3.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKAddrPickerDelegate.h"

@interface SKAddrPickerDelegate ()

@property (nonatomic, assign) NSInteger provinceIndex;
@property (nonatomic, assign) NSInteger cityIndex;
@property (nonatomic, assign) NSInteger areaIndex;

@property (nonatomic, strong) NSArray *cityArray;
@property (nonatomic, strong) NSArray *areaArray;

@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *area;


@end

@implementation SKAddrPickerDelegate

- (instancetype)init {

    self = [super init];
    
    if (self) {
        _provinceIndex = _cityIndex = _areaIndex = 0;
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    
    NSDictionary *dic = [_dataArray objectAtIndex:_cityIndex];
    _province = [dic objectForKey:@"state"];
    _cityArray = [dic objectForKey:@"cities"];
    
    NSDictionary *arDic = [_cityArray objectAtIndex:_areaIndex];
    _city = [arDic objectForKey:@"city"];
    
    _areaArray = [arDic objectForKey:@"areas"];
    _area = @"";
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    NSInteger count = 0;
    switch (component) {
        case 0:
        {
            count = [_dataArray count];
        }
            break;
        case 1:
        {
            count = [_cityArray count];
        }
            break;
        case 2:{
            count = [_areaArray count];
        }
            break;
        default:
            break;
    }
    return count;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
        {
            _provinceIndex = row;
            _cityIndex = 0;
            _areaIndex = 0;
            
            NSDictionary *dic = [_dataArray objectAtIndex:row];
            _cityArray = [dic objectForKey:@"cities"];
            _province = [dic objectForKey:@"state"];
            
            NSDictionary *arDic = [_cityArray objectAtIndex:0];
             _city = [arDic objectForKey:@"city"];
            
            _areaArray = [arDic objectForKey:@"areas"];
            
            if (_areaArray && _areaArray.count > 0) {
                _area = [_areaArray objectAtIndex:0];
            }else{
                _area = @"";
            }
            
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
        }
            break;
        case 1:
        {
            _cityIndex = row;
            _areaIndex = 0;
            NSDictionary *arDic = [_cityArray objectAtIndex:row];
            _city = [arDic objectForKey:@"city"];

            _areaArray = [arDic objectForKey:@"areas"];
            
            if (_areaArray && _areaArray.count > 0) {
                _area = [_areaArray objectAtIndex:0];
            }else{
                _area = @"";
            }

            [pickerView reloadComponent:2];
        
        }
            break;
        case 2:
        {
            _areaIndex = row;
            _area = [_areaArray objectAtIndex:_areaIndex];
        }
            break;
        default:
                break;
        }
    
    NSLog(@"asdsadasd");
    if (_block) {
        NSString *str = [NSString stringWithFormat:@"%@ %@ %@",_province, _city, _area];
        _block(str);
    }
//    if([self.delegate respondsToSelector:@selector(pickerDidChaneStatus:)]) {
//        [self.delegate pickerDidChaneStatus:self];
//    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   NSString *title = @"";
    switch (component) {
            
        case 0:
        {
            NSDictionary *proDic = [_dataArray objectAtIndex:row];
            title = [proDic objectForKey:@"state"];
        }
            break;
        case 1:
        {
            NSDictionary *cityDic = [_cityArray objectAtIndex:row];
            title = [cityDic objectForKey:@"city"];
        }
            break;
        case 2:
        {
            
            title = [_areaArray objectAtIndex:row];
        
        }
        default:
            break;
    }
    
    return title;
}



@end











