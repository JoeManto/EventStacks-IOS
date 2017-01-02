//
//  UIView+EditSelectedView.h
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/9/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditSelectedView : UIView <UIPickerViewDelegate, UIPickerViewDataSource>{
    NSArray * pickerData;

}


@property (nonatomic,strong)UILabel * editedDayLabel;
@property (nonatomic,strong)UILabel * editedDateAndTimeLabel;

@property (nonatomic,strong)UIPickerView * pickerView;

- (id)initWithFrame:(CGRect)frame;
@end
