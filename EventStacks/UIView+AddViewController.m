//
//  UIView+AddViewController.m
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/30/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "UIView+AddViewController.h"

@interface AddViewController ()

@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) UINavigationBar * navBar;
@property (strong,nonatomic) NSMutableDictionary* data;

@end

NSArray * sections;
NSArray * keys;
NSInteger inx;
NSInteger section1NumRows;

@implementation AddViewController 

- (void)viewDidLoad {
    inx = 0;
    section1NumRows = 1;
    //change data layout to conform to insertatindexforrow.
    keys = @[@"EventName",@"EventDate",@"EventTime",@"ShouldNotify",@"NotifyTime"];
    sections = @[@"Event Details",@"Event Notfication"];
    _data = [[NSMutableDictionary alloc]initWithObjects:@[@"BlankName",[NSDate date],@"0:00AM",@0,[NSDate date]] forKeys:@[@"EventName",@"EventDate",@"EventTime",@"ShouldNotify",@"NotifyTime"]];
    [self tableInit];
  
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 3;
    }
    if(section == 1){
        return section1NumRows;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1 && indexPath.row == 0){
        indexPath = [NSIndexPath indexPathForRow:3 inSection:1];
    }
    static NSString *cellIdentifier = @"cellIdentifier";
    UIView * cv;
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //CGRect contentViewFrame = cell.contentView.frame;
        //contentViewFrame.size.width = _table.frame.size.width;
        //cell.contentView.frame = contentViewFrame;
       
    }
    cv = cell.contentView;
    cell.textLabel.text = [keys objectAtIndex:indexPath.row];
    
    
    if([[_data objectForKey:[keys objectAtIndex:indexPath.row]] isKindOfClass:[NSString class]]){
        NSString * string = [_data objectForKey:[keys objectAtIndex:indexPath.row]];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(cv.frame.size.width-100, -cv.frame.size.height/2, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",string];
        [cv addSubview:dataLabel];
    }else if([[_data objectForKey:[keys objectAtIndex:indexPath.row]] isKindOfClass:[NSDate class]]){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSDate * date = [_data objectForKey:[keys objectAtIndex:indexPath.row]];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(cv.frame.size.width-100, -cv.frame.size.height/2, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:date]];
        [cv addSubview:dataLabel];
    }else if([[_data objectForKey:[keys objectAtIndex:indexPath.row]] isKindOfClass:[NSNumber class]]){
        NSNumber * number = [_data objectForKey:[keys objectAtIndex:indexPath.row]];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(cv.frame.size.width-100, -cv.frame.size.height/2, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",number];
        
        UISwitch *notifySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(cv.frame.size.width-100, cv.frame.size.height/2-13, 0, 0)];
        [notifySwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
        [cv addSubview:notifySwitch];
    }
   
  
   /* if(indexPath.row != 2){
         UIImageView *seperatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(15, cell.frame.size.height+5, cell.frame.size.width, 0.5)];
         [seperatorLine setBackgroundColor:[UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0]];
         [cell addSubview:seperatorLine];
        
    }
    */
    
    NSLog(@"index section %ld index row %ld",indexPath.section,indexPath.row);
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    
    EditSelectedView * editingView = [[EditSelectedView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height/2-150, 300, 300)];
    [self.view addSubview:editingView];
    */
}


-(void)switchToggled:(id)selctor{
    if(section1NumRows < 2){
        section1NumRows++;
        NSArray *insertIndexPaths = [NSArray arrayWithObjects:
                                 [NSIndexPath indexPathForRow:1 inSection:1],
                                 nil];
        [_table beginUpdates];
        [_table insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationRight];
       // [_table reloadRowsAtIndexPaths: withRowAnimation:UITableViewRowAnimationRight];
        NSLog(@"SS");
        [_table endUpdates];
       
        
    }else{
        section1NumRows--;
        NSArray *insertIndexPaths = [NSArray arrayWithObjects:
                                     [NSIndexPath indexPathForRow:1 inSection:1],
                                     nil];
        [_table beginUpdates];
        NSLog(@"sss");
        [_table deleteRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationRight];
        [_table endUpdates];
       
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //UITouch *touch = [touches anyObject];
    
    /* if(count < 1){
     [_delegate showSideView];
     count++;
     }else if(count == 1){
     [_delegate removeSideView];
     count = 0;
     }
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)tableInit{
    _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _table.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    _table.delegate = self;
    _table.dataSource = self;
    _table.alwaysBounceVertical = true;
    _table.showsVerticalScrollIndicator = true;
    _table.contentInset = UIEdgeInsetsMake(64,0,0,0);
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.table];
    
}



@end
