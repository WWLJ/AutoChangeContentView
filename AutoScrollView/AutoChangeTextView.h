//
//  AutoChangeTextView.h
//  AutoScrollView
//
//  Created by YiTie on 16/4/18.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AutoChangeTextView : UIView

/**
 *  数据源
 */
@property (nonatomic, strong)NSArray *dataSource;

/**
 *  背景色
 */
@property (nonatomic, strong)UIColor *backGroundColor;

/**
 *  子控件的高度  默认30
 *
 *  如果需要设置,请在设置数据源之前设置
 */
@property (nonatomic, assign)CGFloat labelHeight;

/**
 *  文字停留时间  默认5S
 */
@property (nonatomic, assign)CGFloat delayTime;


@end
