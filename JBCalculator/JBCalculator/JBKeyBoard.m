//
//  JBKeyBoard.m
//  JBCalculator
//
//  Created by Biao on 16/4/29.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "JBKeyBoard.h"

@interface JBKeyBoard ()
{
    Opration *oper;
    double a;
    BOOL flag;
}
@end

@implementation JBKeyBoard

- (id)initWithFrame:(CGRect)frame
{
    if([super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor blackColor];
        //初始化显示的是0
        self.result = [[NSMutableString alloc]initWithFormat:@"0"];
        flag = YES;
        int width = frame.size.width;
        int height = frame.size.height;
        
        for(int i=0;i<5;i++)
        {
            for(int j=0;j<4;j++)
            {
                if((i==4)&&(j==0))
                {
                    //这里创建的是按键 0 的按钮,因为按键 0 占了两个,宽度是原先的两倍,并且跳过下一次的按钮创建
                    _b = [[UIButton alloc]initWithFrame:CGRectMake(j * (width / 4), i * (height / 5), width / 2, height / 5)];
                    _b.backgroundColor = [UIColor lightGrayColor];
                    //设置tag的值
                    _b.tag = (i+1) * 10 + (j+1);
                    //设置边框
                    [_b.layer setBorderWidth:1];
                    [_b setTitle:@"0" forState:UIControlStateNormal];
                    [_b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    [self addSubview:_b];
                    j++;
                    continue;
                }
                
                /**
                 *  @author Biao
                 *
                 *  按钮的创建,按钮的宽度是通过计算出来的,为了屏幕的适配
                 */
                _b = [[UIButton alloc]initWithFrame:CGRectMake(j*(width/4), i*(height/5), width/4, height/5)];
                _b.backgroundColor = [UIColor lightGrayColor];
                [_b.layer setBorderWidth:1];
                _b.tag = (i+1) * 10 + (j+1);
                
                /**
                 *  @author Biao
                 *
                 *  在这里设置最上边竖排的按钮颜色为橘红色
                 */
                if(((j+1) == 4))
                {
                    [_b setBackgroundColor:[UIColor orangeColor]];
                }
                [self addSubview:_b];
                
                /**
                 *  @author Biao
                 *
                 *  在这里,为数字按钮显示的值
                 */
                if(i>0 && j<3 && i<4)
                {
                    //num的值可以通过计算出来,与i,j相关
                    int num = (3-i)*3+(j+1);
                    
                    //把int转成字符串,并给按钮赋值
                    NSString *s = [NSString stringWithFormat:@"%d",num];
                    [_b setTitle:s forState:UIControlStateNormal];
                    [_b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    //这里为数字按钮设置方法,因为数字是一类的,所以都用一个方法
                }
                
                switch (_b.tag)
                {
                    case 11:
                        [_b setTitle:@"C" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(clearNum) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 12:
                        [_b setTitle:@"+/-" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(symbol:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 13:
                        [_b setTitle:@"%" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(percent:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 14:
                        [_b setTitle:@"/" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 24:
                        [_b setTitle:@"x" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 34:
                        [_b setTitle:@"-" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 44:
                        [_b setTitle:@"+" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                        
                    case 53:
                        [_b setTitle:@"." forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(decimal:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 54:
                        [_b setTitle:@"=" forState:UIControlStateNormal];
                        [_b addTarget:self action:@selector(OptionResult) forControlEvents:UIControlEventTouchDown];
                        break;
                    default:
                        break;
                }
            }
        }
    }
    return self;
}



- (void)decimal:(UIButton *)btn
{
    if([self.result isEqualToString:@""])
    {
        [self.result appendString:@"0."];
    }
    else
    {
        [self.result appendString:@"."];
    }
}


/**
 *  @author Biao
 *
 *  数字按钮的方法
 */
- (void)number:(UIButton *)btn
{
    if([self.result isEqualToString:@"0"])
    {
        [self.result setString:@""];//如果初始化状态为0,先置空一下,这样做的目的是为了在显示的时候不会开头还带了一个0
    }
    
    /**
     *  @author Biao
     *
     *  这里的result是可变的字符串,这样才可以对自己进行更改,添加.
     */
    [self.result appendString:btn.titleLabel.text];
    
    /**
     *  @author Biao
     *
     *  把所以得输入拼接起来,得到一个完整的多位数字
     */
    self.num1 = [self.result doubleValue];//转成
    
    /**
     *  @author Biao
     *
     *  这里是取得父视图,通过tag取到label,但是注意一点的是,通过tag取到的视图对象,这里先强制类型转换一下,然后用UILabel对象接收,这样就可以操作这个label对象
     */
    UILabel *label = (UILabel *)[[self superview] viewWithTag:1];
    label.text = self.result;
}

/**
 *  @author Biao
 *
 *  清除按钮
 */
- (void)clearNum
{
    [self.result setString:@"0"];
    self.num1 = 0;
    self.num2 = 0;
    a = 0;
    UILabel *label = [(UILabel *)[self superview] viewWithTag:1];
    label.text = self.result;
}

/**
 *  @author Biao
 *
 *  运算符按钮
 */
- (void)myOption:(UIButton *)btn
{

#pragma mark------这里遇到一个问题,就是在判断中用到char类型,而按钮的text是string类型,需要先强制转换一下
    const char *options = [btn.titleLabel.text UTF8String];
    
    char option = options[0];
    
    if(option == 'x')
    {
        option = '*';
    }
    
    /**
     *  @author Biao
     *
     *  在网上搜到这个，转utf8，转换成char字符串，然后再取到第一个。为什么不能直接转？因为他们的编码方式不同，转换之后就不是想要的字符串了
     */
    NSLog(@"==========>%c",option);
    
    oper = [OperationFactory creatOpration:option];
    self.num2 = [self.result doubleValue];
    
    /**
     *  @author Biao
     *
     *  每次都要置空一下,为了下一次的字符输入
     */
    [self.result setString:@""];
}



/**
 *  @author Biao
 *
 *  等号按钮
 */
- (void)OptionResult
{
    if(a!=0 && self.num2 == 0)
    {
        //判断如果运算完之后继续运算的话,用之前的结果当做第一个数
        self.num2 = a;
    }
    /**
     *  @author Biao
     *
     *  为运算类的两个数赋值
     */
    oper.number1 = self.num2;
    oper.number2 = self.num1;
    NSLog(@"%f",oper.number2);
    
    /**
     *  @author Biao
     *
     *  执行运算方法
     */
    [self.result setString:[oper getResult]];
    
    [self clearZero];
    UILabel *label = [(UILabel *)[self superview] viewWithTag:1];
    label.text = self.result;
    //接收运算结果
    a = [self.result doubleValue];
    [self.result setString:@""];
    /**
     *  @author Biao
     *
     *  置空,为下一次输入准备
     */
    self.num2 = 0;
}


- (void)symbol:(UIButton *)btn
{
    if(a!=0 && [self.result isEqualToString:@""])
    {
        self.num1 = a;
    }
    self.num1 = -self.num1;
    [self.result setString:[NSString stringWithFormat:@"%f",self.num1]];
    [self clearZero];
    UILabel *label = (UILabel *)[[self superview] viewWithTag:1];
    label.text = self.result;
}


/**
 *  @author Biao
 *
 *  百分数
 */
- (void)percent:(UIButton *)btn
{
    if(a!=0 &&[self.result isEqualToString:@""])
    {
        self.num1 = a;
    }
    self.num1 = self.num1*0.01;
    [self.result setString:[NSString stringWithFormat:@"%lf",self.num1]];
    [self clearZero];
    UILabel *lable = [(UILabel *)[self superview] viewWithTag:1];
    lable.text = self.result;
}




/**
 *  @author Biao
 *
 *  清空数字
 */
- (void)clearZero
{
    for(int i = [self.result length]-1;i>=0;i--)
    {
        char c = [self.result characterAtIndex:i];
        
        switch (c)
        {
            case '0':
                /**
                 *  @author Biao
                 *
                 *  删除字符范围
                 */
                [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
                break;
            case '.':
                [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
                /**
                 *  @author Biao
                 *  
                 *  end:数据输出流中，对流定义了很多静态常量,end:是定义的新类型ios::seek_dir(实际定义是int类型）
                 *
                 *  UITextPosition:文本位置
                 */
                goto end;//结束
                break;
            default:
                goto end;
                break;
        }
    }
    end:;

}




@end
