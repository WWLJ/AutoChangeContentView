//
//  AutoChangeTextView.m
//  AutoScrollView
//
//  Created by YiTie on 16/4/18.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "AutoChangeTextView.h"
#import "CFDynamicLabel.h"
#import "BBCyclingLabel.h"

@interface AutoChangeTextView ()
/**
 *  每页子控件的个数
 */
@property (nonatomic, assign)NSInteger pageCount;
/**
 *  页数
 */
@property (nonatomic, assign)NSInteger pageIndex;

/**
 *  当前显示页
 */
@property (nonatomic, assign)NSInteger currentIndex;

@end

@implementation AutoChangeTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _labelHeight = 30.0;
        self.currentIndex = 0;
        self.delayTime = 5.0;
        
    }
    return self;
}


-(void)setLabelHeight:(CGFloat)labelHeight
{
    _labelHeight = labelHeight;
}

-(void)setDataSource:(NSArray *)dataSource
{
    _dataSource = dataSource;
    [self setUpUI];
}

- (void)setUpUI
{
    if (_backGroundColor == nil) {
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = _backGroundColor;
    }
    
    //向下取整,每页个数
    self.pageCount = floorf(self.frame.size.height / self.labelHeight);
    //得到总共的页数
    self.pageIndex = ceilf(self.dataSource.count / self.pageCount);
    if (self.dataSource.count % self.pageCount != 0) {
        self.pageIndex++;
    }
    
    NSLog(@"pageCount === %ld", self.pageCount);
    NSLog(@"pageIndex === %ld", self.pageIndex);
    
    
    
    for (int i = 0; i < self.pageCount; i ++) {
        BBCyclingLabel* tempLabel = [self createLabelForAutoViewWithHeight:i * _labelHeight];
        tempLabel.tag = (i + 1) * 100;
        tempLabel.text = [self.dataSource objectAtIndex:i];
        [self addSubview:tempLabel];
    }
    [self performSelector:@selector(toChangeselfSubviews) withObject:nil afterDelay:self.delayTime];
}

- (void)toChangeselfSubviews
{
    //先让当前页+1
    self.currentIndex++;
    NSLog(@"changeTextView");
    if (self.currentIndex < self.pageIndex) {
        NSInteger count = self.currentIndex * self.pageCount;
//        NSLog(@"currentIndex %ld     %ld",self.currentIndex,count);
        for (NSInteger i = count; i < self.pageCount + count; i ++) {
            CFDynamicLabel* tempLabel = [self viewWithTag:(i - count + 1) * 100];
            if (i < self.dataSource.count) {
                tempLabel.text = [self.dataSource objectAtIndex:i];
            }else{
                tempLabel.text = @"";
            }
        }
    }else{
        self.currentIndex = 0;
        NSInteger count = self.currentIndex * self.pageCount;
//        NSLog(@"currentIndex %ld     %ld",self.currentIndex,count);
        for (NSInteger i = count; i < self.pageCount + count; i ++) {
            CFDynamicLabel* tempLabel = [self viewWithTag:(i - count + 1) * 100];
            tempLabel.text = [self.dataSource objectAtIndex:i];
        }
    }
    [self performSelector:@selector(toChangeselfSubviews) withObject:nil afterDelay:self.delayTime];
}



//
//- (CFDynamicLabel *)createLabelForAutoViewWithHeight:(CGFloat)height
//{
//    CFDynamicLabel* testLabel = [[CFDynamicLabel alloc] initWithFrame:CGRectMake(0, height, self.frame.size.width, _labelHeight)];
//    testLabel.speed = 0.3;
//    testLabel.text = @"我不想说再见,不说再见,越长大越孤单";
//    testLabel.textColor = [UIColor yellowColor];
//    testLabel.font = [UIFont systemFontOfSize:23];
//    testLabel.backgroundColor = [UIColor grayColor];
//    return testLabel;
//}

- (BBCyclingLabel *)createLabelForAutoViewWithHeight:(CGFloat)height
{
    BBCyclingLabel* testLabel = [[BBCyclingLabel alloc] initWithFrame:CGRectMake(0, height, self.frame.size.width, _labelHeight)];
    testLabel.transitionDuration = 0.5;
    testLabel.text = @"我不想说再见,不说再见,越长大越孤单";
    testLabel.textColor = [UIColor yellowColor];
    testLabel.font = [UIFont systemFontOfSize:15];
    testLabel.backgroundColor = [UIColor grayColor];
    testLabel.transitionEffect = BBCyclingLabelTransitionEffectScaleFadeOut;
    return testLabel;
}

@end
