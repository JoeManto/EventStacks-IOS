//
//  UIView+AddViewController.m
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/30/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "UIView+AddViewController.h"
#import "EventData.h"

@interface AddViewController ()

@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) UINavigationBar * navBar;
@property (strong,nonatomic) NSMutableDictionary* data;
@property (strong,nonatomic) NSMutableArray *keys;

@property (strong,nonatomic) UITextField * EventName;
@property (strong,nonatomic) UILabel * EventDate;
@property (strong,nonatomic) UILabel * EventTime;
@property (strong,nonatomic) UILabel * EventNotify;

@property (nonatomic) UIDatePicker * datePicker;
@property (nonatomic) UIToolbar * toolBar;

@property (nonatomic, assign) id currentResponder;

@end

@implementation AddViewController 

- (void)viewDidLoad
{
    _data = [[NSMutableDictionary alloc]init];
    [_data setObject:@"Blank Name" forKey:@"Event Name"];
    [_data setObject:[NSDate date] forKey:@"Event Date"];
    [_data setObject:@"3:00PM" forKey:@"Event Time"];//data here needs to be changed and in the config methods
    [_data setObject:@0 forKey:@"Should Notify"];
    
    _keys = [[NSMutableArray alloc]init];
    NSMutableArray *insideArray1 = [[NSMutableArray alloc] init];
    [insideArray1 addObject:@"Event Name"];
    [insideArray1 addObject:@"Event Date"];
    [insideArray1 addObject:@"Event Time"];
    
    NSMutableArray *insideArray2 = [[NSMutableArray alloc] init];
    [insideArray2 addObject:@"Should Notify"];
    [insideArray2 addObject:@"Notify Time"];
    
    [_keys addObject:insideArray1];
    [_keys addObject:insideArray2];

    [self tableInit];
    [self navBarInit];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
}
//-------------------Delegate_Methods--------------------------
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    [headerView setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0]];
    UIView * lineBot = [[UIView alloc]initWithFrame:CGRectMake(0, 34.4, self.view.frame.size.width, 0.4)];
    lineBot.backgroundColor = [UIColor colorWithRed:0.77 green:0.77 blue:0.77 alpha:1.0];
    UIView * lineTop = [[UIView alloc]initWithFrame:CGRectMake(0, 0.6, self.view.frame.size.width, 0.4)];
    lineTop.backgroundColor = [UIColor colorWithRed:0.77 green:0.77 blue:0.77 alpha:1.0];
    [headerView addSubview:lineTop];
    [headerView addSubview:lineBot];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 3;
    }
    if(section == 1){
        if(_data.count == 5){
            return 2;
        }else{
            return 1;
        }
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UIView * cv;
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        CGRect contentViewFrame = cell.contentView.frame;
        contentViewFrame.size.width = _table.frame.size.width;
        cell.contentView.frame = contentViewFrame;

    cv = cell.contentView;
    cell.textLabel.text = _keys[indexPath.section][indexPath.row];
    if([[_data objectForKey:_keys[indexPath.section][indexPath.row]] isKindOfClass:[NSString class]]){
            NSString * string = [_data objectForKey:_keys[indexPath.section][indexPath.row]];
            NSLog(@"section %ld row %ld",indexPath.section,indexPath.row);
            if(indexPath.section == 0){
                if(indexPath.row == 0){
                    [self configEventNameView:string];
                    [cv addSubview:_EventName];
                }else if(indexPath.row == 2)
                    [self configEventTime:string];
                    [cv addSubview:_EventTime];
            }else
                [self configEventNotifyTimeView:string];
                [cv addSubview:_EventNotify];
        
    }else if([[_data objectForKey:_keys[indexPath.section][indexPath.row]] isKindOfClass:[NSDate class]]){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        NSDate * date = [_data objectForKey:_keys[indexPath.section][indexPath.row]];
        [self configEventDateView];
        _EventDate.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:date]];
        [cv addSubview:_EventDate];
    }else if([[_data objectForKey:_keys[indexPath.section][indexPath.row]] isKindOfClass:[NSNumber class]]){
        UISwitch *notifySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(300, 10, 0, 0)];
        [notifySwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
        [cv addSubview:notifySwitch];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (void)textFieldDidEndEditing:(UITextView *)textView
{
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [_currentResponder resignFirstResponder];
    [self removeDatePickerAndToolBar:_EventDate];
    _currentResponder = _EventName;
    return true;
}
- (BOOL)textFieldShouldReturn: (UITextField *) textField
{
    return YES;
}
//-----------------------Config_Methods--------------------------
- (void)tableInit
{
    _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_table setBackgroundColor:[UIColor whiteColor]];
    _table.delegate = self;
    _table.dataSource = self;
    _table.alwaysBounceVertical = true;
    _table.showsVerticalScrollIndicator = true;
    _table.contentInset = UIEdgeInsetsMake(64,0,0,0);
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.table];
}
- (void)navBarInit
{
    _navBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    _navBar.barTintColor = [UIColor whiteColor];
    _navBar.translucent = NO;
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0],
                                 NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0]
                                 };
    [_navBar setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    navItem.title = @"Add Details";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(Canceled:)];
    leftButton.tintColor = [UIColor redColor];
    navItem.leftBarButtonItem = leftButton;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(PackageDataAndCheckInfomation:)];
    rightButton.tintColor = [UIColor redColor];
    navItem.rightBarButtonItem = rightButton;
    _navBar.items = @[navItem];
    [self.view addSubview:_navBar];
}
- (void)toolBarInit
{
    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-310, self.view.frame.size.width, 44)];
    _toolBar.barStyle   = UIBarStyleBlackOpaque;
    _toolBar.opaque = NO;
    _toolBar.backgroundColor = [UIColor clearColor];
    _toolBar.barTintColor = [UIColor whiteColor];
    UIBarButtonItem *itemDone  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(removeDatePickerAndToolBar:)];
    itemDone.tintColor = [UIColor redColor];
    UIBarButtonItem *itemSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    _toolBar.items = @[itemSpace,itemDone];
    [self.view addSubview:_toolBar];
}
- (BOOL)checkNameDetails:(NSString*)name
{
    if(name.length>20 || name.length<3){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invaid Entry" message:
                                              @"Invaid Entry: Event Name length can only be less then or equal to 20 and be greater than 2"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
        return false;
    }else
        return true;
}
- (void)configEventNameView:(NSString*)s
{
    _EventName = [[UITextField alloc]initWithFrame:CGRectMake(150, -25, 200, 100)];
    _EventName.delegate = self;
    _EventName.placeholder = s;
    _EventName.textColor = [UIColor grayColor];
    _EventName.textAlignment = NSTextAlignmentRight;
    _EventName.userInteractionEnabled = YES;
    _EventName.keyboardType = UIKeyboardTypeTwitter;
    [_EventName becomeFirstResponder];
}
- (void)configEventDateView
{
    _EventDate = [[UILabel alloc]initWithFrame:CGRectMake(150+100, -25, 100, 100)];
    _EventDate.textColor = [UIColor colorWithRed:201.0f/255.0f green:201.0f/255.0f blue:207.0f/255.0f alpha:1000];
    _EventDate.textAlignment = NSTextAlignmentRight;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeDate:)];
    [_EventDate setUserInteractionEnabled:YES];
    [_EventDate addGestureRecognizer:gesture];
}
- (void)configEventTime:(NSString*)s
{
    _EventTime = [[UILabel alloc]initWithFrame:CGRectMake(150+100, -25, 100, 100)];
    _EventTime.text = s;
    _EventTime.tag = 0;
    _EventTime.textColor = [UIColor colorWithRed:201.0f/255.0f green:201.0f/255.0f blue:207.0f/255.0f alpha:1000];
    _EventTime.textAlignment = NSTextAlignmentRight;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTime:)];
    [_EventTime setUserInteractionEnabled:YES];
    [_EventTime addGestureRecognizer:gesture];
}
- (void)configEventNotifyTimeView:(NSString*)s
{
    _EventNotify = [[UILabel alloc]initWithFrame:CGRectMake(150+100, -25, 100, 100)];
    _EventNotify.text = s;
    _EventNotify.tag = 1;
    _EventNotify.textColor = [UIColor colorWithRed:201.0f/255.0f green:201.0f/255.0f blue:207.0f/255.0f alpha:1000];
    _EventNotify.textAlignment = NSTextAlignmentRight;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTime:)];
    [_EventNotify setUserInteractionEnabled:YES];
    [_EventNotify addGestureRecognizer:gesture];
}
//-----------------------Sender_Methods--------------------------
-(void)resignOnTap:(id)sender
{
    if(_currentResponder == _EventDate || _currentResponder == _EventTime)
        [self removeDatePickerAndToolBar:_EventTime];
    [_currentResponder resignFirstResponder];
}
-(void)Canceled:(id)sender
{
    
}
-(void)PackageDataAndCheckInfomation:(id)sender
{
    if([self checkNameDetails:_EventName.text]){
       /* EventData * event = [EventData alloc]initWithData:[_data objectForKey:@"Event Name"] withEventDate:[_data objectForKey:@"Event Date"]
    withEventTime:[_data objectForKey:@"Event Time"] withNotifyDate:[] withNotifyTime:<#(NSString *)#>*/
        
    }
}
-(void)changeDate:(id)sender
{
    [_currentResponder resignFirstResponder];
    _currentResponder = _EventDate;
       if(_datePicker == nil)
           self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-300, self.view.frame.size.width, 300)];
           [self.datePicker setDatePickerMode:UIDatePickerModeDate];
           [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
           [self.view addSubview:_datePicker];
           //[self toolBarInit];
           [_datePicker becomeFirstResponder];
    _datePicker.datePickerMode = UIDatePickerModeDate;
}
-(void)changeTime:(id)sender
{
    UILabel *lb = (UILabel*)[(UIGestureRecognizer *)sender view];
    
    
    if(_datePicker == nil)
        self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-300, self.view.frame.size.width, 300)];
        [self.datePicker setDatePickerMode:UIDatePickerModeDate];
        [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker];
        //[self toolBarInit];
    if(lb.tag == 0){
        [_currentResponder resignFirstResponder];
        _currentResponder = _EventTime;
        [_datePicker becomeFirstResponder];
    }else{
        [_currentResponder resignFirstResponder];
        _currentResponder = _EventNotify;
        [_datePicker becomeFirstResponder];
    }
    
    _datePicker.datePickerMode = UIDatePickerModeTime;
}
-(void)onDatePickerValueChanged:(id)sender
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSLog(@"%@",_datePicker.date);
    if(_datePicker.datePickerMode){
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        _EventDate.text  = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:_datePicker.date]];
        [_data setObject:_datePicker.date forKey:@"Event Date"];
    }else{
        [dateFormat setDateFormat:@"hh:mm a"];
        if(_currentResponder == _EventNotify){
            NSLog(@"ss");
            _EventNotify.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:_datePicker.date]];
            [_data setObject:[NSString stringWithFormat:@"%@",_datePicker.date ] forKey:@"Notify Time"];
            NSLog(@"%@",_data);
        }else{
            _EventTime.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:_datePicker.date]];
            [_data setObject:_datePicker.date forKey:@"Event Time"];
        }
    }
}
-(void)removeDatePickerAndToolBar:(id)sender
{
    [self.datePicker removeFromSuperview];
    self.datePicker = nil;
    [self.toolBar removeFromSuperview];
    self.toolBar = nil;
}
-(void)switchToggled:(id)selctor
{
    if(_data.count <= 4){
        NSArray *insertIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:1],nil];
        if([_data objectForKey:@"Notify Time"] == nil)
             [_data setObject:@"fff" forKey:@"Notify Time"];//fix
        [_table beginUpdates];
        [_table insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationLeft];
        [_table endUpdates];
    }else{
        [_currentResponder resignFirstResponder];
        [self removeDatePickerAndToolBar:_EventTime];
        NSArray *deleteIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:1],nil];
        [_data removeObjectForKey:@"Notify Time"];
        _EventNotify.text = @"";
        [_table beginUpdates];
        [_table deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationRight];
        [_table endUpdates];
    }
}

@end
