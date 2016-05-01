//
//  OperationFactory.m
//  JBCalculator
//
//  Created by Biao on 16/4/28.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "OperationFactory.h"

@implementation OperationFactory

+ (id)creatOpration:(char)operate
{
    Opration *oper;
    
    /**
     *  @author Biao
     *
     *  根据参数的不同创建对象,这里的参数是输入的运算符
     */
    switch (operate)
    {
        case '+':
            oper = [[OprationAdd alloc]init];
            break;
        case '-':
            oper = [[OprationSub alloc]init];
            break;
        case '*':
            oper = [[OprationMul alloc]init];
            break;
        case '/':
            oper = [[OprationDiv alloc]init];
        default:
            break;
    }
    return oper;
}
@end
