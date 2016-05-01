//
//  Opration.h
//  JBCalculator
//
//  Created by Biao on 16/4/28.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Opration : NSObject

/**
 *  @author Biao
 *
 *  多态:有一个计算类是父类,子类有加减乘除,创建的时候是父类对象,具体的操作用子类创建.创建的时候用工厂
 */

@property (nonatomic,assign)double number1;
@property (nonatomic,assign)double number2;

- (id)initWithNum1:(double)num1 andNum2:(double)num2;
- (NSString *)getResult;

@end

/**
 *  @author Biao
 *
 *  子类:这里用代码在一个类里面创建
 */
@interface OprationAdd : Opration
@end

@interface OprationSub : Opration
@end

@interface OprationMul : Opration
@end

@interface OprationDiv : Opration
@end