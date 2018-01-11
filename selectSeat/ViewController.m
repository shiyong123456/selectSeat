//
//  ViewController.m
//  selectSeat
//
//  Created by shiyong on 2018/1/9.
//  Copyright © 2018年 SY. All rights reserved.
//

#import "ViewController.h"
#import "SYselectSeatViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"选中" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(selectSeat) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)selectSeat{
    SYselectSeatViewController *selectSeat = [[SYselectSeatViewController alloc]init];
    [self.navigationController pushViewController:selectSeat animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
