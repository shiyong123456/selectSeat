//
//  selectView.h
//  selectSeat
//
//  Created by shiyong on 2018/1/10.
//  Copyright © 2018年 SY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectView : UIView

@property(nonatomic , strong)UIImage *imageNormal;//没选
@property(nonatomic , strong)UIImage *imageSelect;//选中
@property(nonatomic , strong)UIImage *imageBuy;//已售


@property(nonatomic , assign)NSInteger count;

@property(nonatomic , assign)BOOL last;

@property(nonatomic , strong)NSMutableArray *selectSeatArray;//选中的标签数组

@property(nonatomic , strong)NSMutableArray *selectImageView;//选中的座位

@end
