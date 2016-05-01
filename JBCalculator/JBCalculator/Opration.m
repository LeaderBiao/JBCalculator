//
//  Opration.m
//  JBCalculator
//
//  Created by Biao on 16/4/28.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "Opration.h"

@implementation Opration

/**
 *  @author Biao
 *
 *  初始化两个数字
 */
- (id)initWithNum1:(double)num1 andNum2:(double)num2
{
    if([super init])
    {
        self.number1 = num1;
        self.number2 = num2;
    }
    return self;
}


/**
 *  @author Biao
 *
 *  父类的运算
 */
- (NSString *)getResult
{
    double result = 0;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;
}

@end


/**
 *  @author Biao
 *
 *  下面全是子类,重写父类的运算方法
 */

@implementation OprationAdd
- (NSString *)getResult
{
    double result = 0;
    result =  self.number1 + self.number2;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;
}
@end


@implementation OprationSub
- (NSString *)getResult
{
    double reslut = 0;
    reslut = self.number1 - self.number2;
    NSString *str = [NSString stringWithFormat:@"%lf",reslut];
    return str;
}
@end



@implementation OprationMul
- (NSString *)getResult
{
    double result = 0;
    result = self.number1 * self.number2;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;

}
@end


@implementation OprationDiv
- (NSString *)getResult
{
    double result = 0;
    NSString *str;
    if(self.number2 == 0)
    {
        str = [NSString stringWithFormat:@"错误"];
    }
    else
    {
        result = self.number1 / self.number2;
        str = [NSString stringWithFormat:@"%lf",result];
    }
    return  str;
}
@end



