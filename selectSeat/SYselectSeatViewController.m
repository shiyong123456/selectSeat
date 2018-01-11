//
//  SYselectSeatViewController.m
//  selectSeat
//
//  Created by shiyong on 2018/1/9.
//  Copyright © 2018年 SY. All rights reserved.
//

#import "SYselectSeatViewController.h"

@interface SYselectSeatViewController ()<UIScrollViewDelegate>

@end

@implementation SYselectSeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    [self.view addSubview:self.scrollView];
    
    //设置实现缩放
    //设置代理scrollview的代理对象
    self.scrollView.delegate=self;
    //设置最大伸缩比例
    self.scrollView.maximumZoomScale=2.0;
    //设置最小伸缩比例
    self.scrollView.minimumZoomScale=0.5;

    self.selectView = [[selectView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500)];
    [self.scrollView addSubview:self.selectView];
    self.delegate = self.selectView;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*1.4, 500);
    
    
    _buyButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 600, 80, 50)];
    _buyButton.backgroundColor = [UIColor redColor];
    [_buyButton setTitle:@"购票" forState:UIControlStateNormal];
    [_buyButton addTarget:self action:@selector(buyMovieStamp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buyButton];
}
-(void)buyMovieStamp{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(changeState)]) {
        [self.delegate changeState];
    }
}

#pragma mark-两个手指捏合的时候的缩放代理函数
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.selectView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
