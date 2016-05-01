//
//  JBKeyBoard.h
//  JBCalculator
//
//  Created by Biao on 16/4/29.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperationFactory.h"

@interface JBKeyBoard : UIView
{
    UIButton *_b;
}
@property (nonatomic,assign)double num1;
@property (nonatomic,assign)double num2;
@property (nonatomic,strong)NSMutableString *result;

- (id)initWithFrame:(CGRect)frame;

@end
