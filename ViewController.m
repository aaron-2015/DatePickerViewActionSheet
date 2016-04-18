//
//  ViewController.m
//  DatePickerViewActionSheet
//
//  Created by aaron on 16/4/18.
//  Copyright © 2016年 decai wang. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewActionSheet.h"

@interface ViewController ()

@property (nonatomic,strong) DatePickerViewActionSheet *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)datePickerShow:(UIButton *)sender {
    
    _datePicker = [[DatePickerViewActionSheet alloc] init];
    [_datePicker showInView:self.view];
    _datePicker.finishPick = ^(NSDate *date,NSString *dateString){
        NSLog(@"%@",date);
    };
}

@end
