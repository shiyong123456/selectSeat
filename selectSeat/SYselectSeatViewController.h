//
//  SYselectSeatViewController.h
//  selectSeat
//
//  Created by shiyong on 2018/1/9.
//  Copyright © 2018年 SY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "selectView.h"

@protocol SYselectSeatViewControllerDelegate <NSObject>
-(void)changeState;
@end


@interface SYselectSeatViewController : UIViewController

@property(nonatomic , strong)UILabel *centerLabel;//银幕中央

@property(nonatomic , strong)UILabel *lineLabel;//分割的虚线

@property(nonatomic , strong)UIView *leftView;//左侧的序号试图

@property(nonatomic , strong)selectView *selectView;//最主要的座位试图

@property(nonatomic , strong)UIScrollView *scrollView;

@property(nonatomic , strong)UIButton *buyButton;//购票支付按钮

@property(nonatomic ,weak)id <SYselectSeatViewControllerDelegate>delegate;

@end
