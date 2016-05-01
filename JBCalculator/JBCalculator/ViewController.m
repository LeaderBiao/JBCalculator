//
//  ViewController.m
//  JBCalculator
//
//  Created by Biao on 16/4/28.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "ViewController.h"
#import "JBKeyBoard.h"

@interface ViewController ()
{
    UILabel *showView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  @author Biao
     *
     *  获取屏幕宽高
     */
    int width = [[UIScreen mainScreen]bounds].size.width;
    int height = [[UIScreen mainScreen]bounds].size.height;
    
    showView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 200)];
    showView.backgroundColor = [UIColor darkGrayColor];
    /**
     *  @author Biao
     *
     *  设置tag,方便后面对它的操作
     */
    showView.tag = 1;
    //向右对齐
    [showView setTextAlignment:NSTextAlignmentRight];
    [showView setFont:[UIFont systemFontOfSize:40]];
    [self.view addSubview:showView];
    
    
    /**
     *  @author Biao
     *
     *  创建一个自定义视图,显示键盘,并且按钮监控
     */
    JBKeyBoard *key = [[JBKeyBoard alloc]initWithFrame:CGRectMake(0, 200, width, height-200)];
    [self.view addSubview:key];
    /**
     *  @author Biao
     *
     *  设置显示的结果
     */
    showView.text = [NSString stringWithFormat:@"%@",key.result];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    UIAlertView *alrt = [[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"" otherButtonTitles:@"", nil];
    [alrt show];
}

@end
