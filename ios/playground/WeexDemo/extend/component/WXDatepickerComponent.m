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

@interface WXDatepickerComponent()

@property (strong, nonatomic) UIInputView *inputView;

@property (strong, nonatomic) WXDatepicker *datepicker;
@end

@implementation WXDatepickerComponent



- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance{
    if (self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance]){
        self.cssNode->style.dimensions[CSS_WIDTH] = 375;
        self.cssNode->style.dimensions[CSS_HEIGHT] = 300;
    }
    
    return self;
}

- (UIView *)loadView
{
    return  [[UIInputView alloc]init];//[[WXDatepicker alloc] init];
}

-(void) viewDidLoad{
    _datepicker = (WXDatepicker *)self.view;
    _datepicker.backgroundColor = [UIColor whiteColor];
    [_datepicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
    
}

-(void)dateChanged{
    
}

@end
