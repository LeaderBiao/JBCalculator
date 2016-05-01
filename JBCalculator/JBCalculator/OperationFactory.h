//
//  OperationFactory.h
//  JBCalculator
//
//  Created by Biao on 16/4/28.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Opration.h"

@interface OperationFactory : NSObject
/**
 *  @author Biao
 *
 *  简单工厂模式,对象由于工厂创建,需要谁就创建谁
 */
+ (id)creatOpration:(char)operate;

@end
