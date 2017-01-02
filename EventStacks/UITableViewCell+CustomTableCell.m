//
//  UITableViewCell+CustomTableCell.m
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/6/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "UITableViewCell+CustomTableCell.h"

@implementation CustomTableCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.currentView = self.contentView;
        
        
    }
    return self;
}


-(void)addSubviews{
    [self setUpViewWithLabels];
    [self.contentView addSubview:_eventName];
    [self.contentView addSubview:_eventTime];
    [self.contentView addSubview:_eventNumItems];
    [self.contentView addSubview:_line];
    [self.contentView addSubview:_sepLine];
}

- (void)setUpViewWithLabels
{
    _eventName = [[UILabel alloc] initWithFrame:CGRectMake(15, 0.0, 220.0, 20.0)];
    _eventName.font = [UIFont systemFontOfSize:18.0];
    _eventName.textColor = [UIColor blackColor];
    _eventName.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
  
    _eventTime = [[UILabel alloc] initWithFrame:CGRectMake(15, 30.0, 220.0, 20.0)];
    _eventTime.font = [UIFont systemFontOfSize:14.0];
    _eventTime.textColor = [UIColor blackColor];
    _eventTime.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    
    _eventNumItems = [[UILabel alloc] initWithFrame:CGRectMake(125.0, 30.0, 220.0, 20.0)];
    _eventNumItems.font = [UIFont systemFontOfSize:14.0];
    _eventNumItems.textColor = [UIColor blackColor];
    _eventNumItems.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    
    _line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height*2, self.frame.size.width*2, 0.4)];
    _line.backgroundColor = [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0];
    
    _sepLine = [[UIView alloc]initWithFrame:CGRectMake(85.0, 64.0, 20.0, 0.4)];
    _sepLine.backgroundColor = [UIColor redColor];
}


- (void)setEventName:(UILabel *)name
{
    self.eventName = name;
}

-(void)setEventTime:(UILabel *)dateAndTime
{
    self.eventTime = dateAndTime;
}

-(void)setEventNumItems:(UILabel *)eventNumItems
{
    self.eventNumItems = eventNumItems;
}

@end
