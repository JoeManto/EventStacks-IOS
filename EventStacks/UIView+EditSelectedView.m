//
//  UIView+EditSelectedView.m
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/9/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "UIView+EditSelectedView.h"

@implementation EditSelectedView : UIView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];

        
        [self configViewAttributes];
        [self configLabels];
        [self addSubview:_editedDayLabel];
        [self addSubview:_editedDateAndTimeLabel];
    }
    return self;
}

-(void)configLabels{
    _editedDayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)];
    _editedDayLabel.font = [UIFont systemFontOfSize:14.0];
    _editedDayLabel.textColor = [UIColor blackColor];
    _editedDayLabel.text = @"editedDayLabel";
    _editedDayLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedOnLink:)];
    [_editedDayLabel setUserInteractionEnabled:YES];
    [_editedDayLabel addGestureRecognizer:gesture];
    
    _editedDateAndTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 20.0, 220.0, 15.0)];
    _editedDateAndTimeLabel.font = [UIFont systemFontOfSize:14.0];
    _editedDateAndTimeLabel.textColor = [UIColor blackColor];
    _editedDateAndTimeLabel.text = @"editedDateAndTimeLabel";
    _editedDateAndTimeLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
}

-(void)configViewAttributes{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10.0;
    self.layer.borderColor = [UIColor colorWithRed:250.f/256.f green:250.f/256.f blue:250.f/256.f alpha:100].CGColor;
    self.layer.borderWidth = 5.0;
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.8];
    [self.layer setShadowRadius:3.0];
    [self.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
}

- (void)userTappedOnLink:(UIGestureRecognizer*)gestureRecognizer{
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, 150)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self addSubview:_pickerView];
}



-(void)showSideView {
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.frame = CGRectMake(self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width, self.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             NSLog(@"showing editing panel");
                         }
                }];
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}



@end
