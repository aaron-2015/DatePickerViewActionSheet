//
//  DatePickerViewActionSheet.h
//  DatePickerViewActionSheet
//
//  Created by aaron on 16/4/18.
//  Copyright © 2016年 decai wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FinishPick)(NSDate *date,NSString *dateString);
typedef void(^CancelPick)();

@interface DatePickerViewActionSheet : UIView

@property (nonatomic, copy) FinishPick finishPick;
@property (nonatomic, copy) CancelPick cancelPick;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) NSDateFormatter *dateFormatter; //可以用来自定义finishPick返回的dateString格式,默认为"yyyy-MM-dd HH:mm"

- (void)showInView:(UIView *)view;

@end
