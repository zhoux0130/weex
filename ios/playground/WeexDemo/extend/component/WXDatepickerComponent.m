//
//  WXDatepickerComponent.m
//  WeexDemo
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 taobao. All rights reserved.
//

#import "WXDatepickerComponent.h"

@interface WXDatepicker : UIDatePicker

@end

@implementation WXDatepicker
@end

@interface WXTextField : UITextField
@end

@implementation WXTextField
@end

@interface WXDatepickerComponent()

@property (strong, nonatomic) WXTextField *dateText;

@property (strong, nonatomic) WXDatepicker *datepicker;

@property (nonatomic) BOOL changeEvent;
@end




@implementation WXDatepickerComponent



- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance{
    if (self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance]){
        _changeEvent = NO;
//        self.ref = @"";
        self.cssNode->style.dimensions[CSS_WIDTH] = 150;
        self.cssNode->style.dimensions[CSS_HEIGHT] = 60;
    }
    
    return self;
}

- (UIView *)loadView
{
    return  [[WXTextField alloc]init];
}

-(void) viewDidLoad{
    
    _dateText = (WXTextField*) self.view;
    _dateText.backgroundColor = [UIColor redColor];
    
    _datepicker=[[WXDatepicker alloc]init];
    _datepicker.datePickerMode=UIDatePickerModeDate;
    _datepicker.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    UIToolbar *dateToolBar=[[UIToolbar alloc]init];
    UIBarButtonItem *doneBtn1=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(dateDoneClick)];
    dateToolBar.barTintColor=[UIColor grayColor];
    dateToolBar.frame=CGRectMake(0, 0, 320, 38);
    
    dateToolBar.items=@[doneBtn1];
    self.dateText.inputView=_datepicker;
    self.dateText.inputAccessoryView=dateToolBar;
    _datepicker.backgroundColor = [UIColor whiteColor];
    
//    [_datepicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
    
}

#pragma mark - Add Event
- (void)addEvent:(NSString *)eventName{
    if ([eventName isEqualToString:@"change"]) {
        _changeEvent = YES;
    }
}

-(void)dateDoneClick{
    [self.view endEditing:YES];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *newDate=[formatter stringFromDate:self.datepicker.date];
    self.dateText.text=[NSString stringWithFormat:@"%@",newDate];
    
    [self fireEvent:@"change" params:@{@"value":newDate}];
}


@end
