//
//  DatePickerViewActionSheet.m
//  DatePickerViewActionSheet
//
//  Created by aaron on 16/4/18.
//  Copyright © 2016年 decai wang. All rights reserved.
//

#import "DatePickerViewActionSheet.h"

@interface DatePickerViewActionSheet ()
@property (nonatomic, strong) UIView *coverView; //底部蒙层View
@property (nonatomic, strong) UIView *finishClickView; //底部确认按钮
@end

@implementation DatePickerViewActionSheet

#pragma mark - life cycle

- (instancetype)init{
    return  [self initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 216 + 44)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 216)];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        _datePicker.backgroundColor = [UIColor whiteColor];
        [_datePicker addTarget:self action:@selector(pickerDidChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_datePicker];
        
        _finishClickView = [[UIView alloc] initWithFrame:CGRectMake(0, _datePicker.bounds.size.height, [UIScreen mainScreen].bounds.size.width, 44)];
        _finishClickView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(finishDidClick:)];
        [_finishClickView addGestureRecognizer:tapGesture];
        [self addSubview:_finishClickView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,_finishClickView.bounds.size.width, _finishClickView.bounds.size.height)];
        titleLabel.userInteractionEnabled = YES;
        titleLabel.text = @"确定";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = [UIColor blackColor];
        [_finishClickView addSubview:titleLabel];
    }
    return self;
}

#pragma mark - action

- (void)pickerDidChange:(UIDatePicker *)picker{
    NSLog(@"%@",picker.date);
}

- (void)finishDidClick:(UITapGestureRecognizer *)recognizer{
    
    if (self.finishPick) {
        self.finishPick(_datePicker.date,@"");
    }
    [self dismissDidClick:nil];
}

- (void)dismissDidClick:(UITapGestureRecognizer *)recognizer{
    
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.frame;
        rect.origin.y = self.superview.bounds.size.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
        [_coverView removeFromSuperview];
        _coverView = nil;
        [self removeFromSuperview];
    }];
}

#pragma mark - method

- (void)showInView:(UIView *)view{
    
    if (_coverView == nil) {
        _coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.3;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDidClick:)];
        [_coverView addGestureRecognizer:tapGesture];
    }
    [view addSubview:self];
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.frame;
        rect.origin.y = view.bounds.size.height - self.bounds.size.height;
        self.frame = rect;
    } completion:^(BOOL finished) {
        [view insertSubview:_coverView belowSubview:self];
    }];
    
}



@end
