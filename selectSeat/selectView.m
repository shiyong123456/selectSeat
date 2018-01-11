//
//  selectView.m
//  selectSeat
//
//  Created by shiyong on 2018/1/10.
//  Copyright © 2018年 SY. All rights reserved.
//

#import "selectView.h"
#import "SYselectSeatViewController.h"
@interface selectView ()<SYselectSeatViewControllerDelegate>

@end

@implementation selectView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _selectSeatArray = [NSMutableArray array];
        _selectImageView = [NSMutableArray array];
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    //三种状态下的选座样式
    self.imageNormal = [UIImage imageNamed:@"com_icon_seat_empty"];
    self.imageSelect = [UIImage imageNamed:@"com_icon_seat_selected"];
    self.imageBuy = [UIImage imageNamed:@"com_icon_seat_hadBuy"];
    //首先自己定义10*10的座位
    for (NSInteger j = 0; j < 10; j++) {
        for (NSInteger i = 0; i<10; i++) {
            UIImageView *selectButton = [[UIImageView alloc]initWithFrame:CGRectMake(i*40+10, j*40+10, 30, 30)];
            selectButton.userInteractionEnabled = YES;
            if (i*j == 24) {
                selectButton.image = self.imageBuy;
            }else{
                selectButton.image = self.imageNormal;
            }
            [self addSubview:selectButton];
        }
    }
}
-(void)changeState{
    for (UIImageView *imageV in _selectImageView) {
        imageV.image = self.imageBuy;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    NSLog(@"x = %lf,y = %lf",touchPoint.x,touchPoint.y);
    NSInteger X = (touchPoint.x-10)/40+1;
    NSInteger Y = (touchPoint.y-10)/40+1;
    NSLog(@"它选中的座位是%d列%d排",X,Y);
    
    //只有点击到座位上的时候才会去做下面的操作
    if ([[touch view] isKindOfClass:[UIImageView class]]) {
        //改变选中的座位的状态，首先去判断时候是选中状态
        UIImageView *imageV = (UIImageView *)[touch view];
        if (imageV.image==self.imageBuy) {
            
        }
        else if(imageV.image==self.imageSelect){
            imageV.image = self.imageNormal;
            [_selectImageView removeObject:imageV];
            //取消选中状态，对应的座位号标签移除，注意如果移除的是中间位置的标签，其他标签的位置要变动
            UILabel *label = (UILabel *)[self.superview.superview viewWithTag:X*100+Y*1000];
            [label removeFromSuperview];
            [_selectSeatArray removeObject:label];
            //对还存在的标签重新布局
            for (NSInteger i = 0; i < _selectSeatArray.count; i++) {
                UILabel *label = _selectSeatArray[i];
                CGRect frame = label.frame;
                frame = CGRectMake(i%3*120+20, 520+40*(i/3), 100, 30);
                label.frame = frame;
            }
        }else{
            
            if (_selectSeatArray.count>=6) {
                //一个人最多选中6个座位
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"一个人最多售卖6张票" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
            }else{
                imageV.image = self.imageSelect;
                [_selectImageView addObject:imageV];
                //选中状态情况下，下面会增加选中的座位号的标签,此时要到它的父试图上去添加，所以这里就要做一个代理
                UILabel *labelSelect = [[UILabel alloc]init];
                labelSelect.tag = X*100+Y*1000;
                [_selectSeatArray addObject:labelSelect];
                labelSelect.frame = CGRectMake(((_selectSeatArray.count-1)%3)*120+20, 520+40*((_selectSeatArray.count-1)/3), 100, 30);
                labelSelect.text = [NSString stringWithFormat:@"%ld列%ld排",X,Y];
                labelSelect.backgroundColor = [UIColor greenColor];
                [self.superview.superview addSubview:labelSelect];
            }
        }
    }
}
@end
