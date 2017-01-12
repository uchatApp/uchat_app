//
//  SKProfileUtil.h
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(int, constellationType) {
    constellationTypeCapricorn, //摩羯
    constellationTypeAquarius,  //水瓶座
    constellationTypePisces,   //双鱼座
    constellationTypeAries,    //白羊座
    constellationTypeTaurus,    //金牛座
    constellationTypeGemini,    //双子座
    constellationTypeCancer, //巨蟹座
    constellationTypeLeo, //狮子座
    constellationTypeVirgo, //处女座
    constellationTypeLibra, //天秤座
    constellationTypeScorpio, //天蝎座
    constellationTypeSagittarius //射手座
    
};

 NSString * constellationWithDate(NSString *date);
