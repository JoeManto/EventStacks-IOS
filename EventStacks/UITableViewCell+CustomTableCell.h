//
//  UITableViewCell+CustomTableCell.h
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/6/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell 

@property (nonatomic,strong) UILabel * eventTime;
@property (nonatomic,strong) UILabel * eventName;
@property (nonatomic,strong)UILabel * eventNumItems;
@property (nonatomic,strong)UIView * line;
@property (nonatomic,strong)UIView * sepLine;
@property (nonatomic) UIView * currentView;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setEventName:(UILabel *)name;
-(void)setEventTime:(UILabel *)dateAndTime;
-(void)setEventNumItems:(UILabel *)eventNumItems;
-(void)addSubviews;

@end
