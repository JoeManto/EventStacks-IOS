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

@implementation AddViewController 

- (void)viewDidLoad {
   
    
    _data = [[NSMutableDictionary alloc]initWithObjects:@[@"BlankName",[NSDate date],@"0:00AM",@false,@"9:00"] forKeys:@[@"EventName",@"EventDate",@"EventTime",@"ShouldNotify",@"NotifyTime"]];
    [self tableInit];
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    [headerView setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0]];

    
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
        return 2;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"poop";
    /*
    static NSString *cellIdentifier = @"cellIdentifier";
    CustomTableCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];   
    
    if(cell == nil) {
        cell = [[CustomTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        CGRect contentViewFrame = cell.contentView.frame;
        contentViewFrame.size.width = _table.frame.size.width;
        cell.contentView.frame = contentViewFrame;
        [cell addSubviews];
    }
    NSString *sectionTitle = [cellSections objectAtIndex:indexPath.section];
    NSDictionary *rowData = [[dayData objectForKey:@"Monday"]objectForKey:[NSString stringWithFormat:@"trip%ld",indexPath.row]];
    NSLog(@"%@ %ld",rowData,indexPath.row);
    
    [cell setBackgroundColor:[UIColor colorWithRed:250.f/256.f green:250.f/256.f blue:250.f/256.f alpha:100]];
    cell.eventName.text = [rowData objectForKey:@"tripName"];
    cell.eventTime.text = [rowData objectForKey:@"time"];
    cell.eventNumItems.text = [rowData objectForKey:@"numItems"];
    if(indexPath.length-1 == indexPath.row){
        cell.line.backgroundColor = [UIColor clearColor];
    }
    return cell;
    */
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    
    EditSelectedView * editingView = [[EditSelectedView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height/2-150, 300, 300)];
    [self.view addSubview:editingView];
    */
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
    _table.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
    _table.delegate = self;
    _table.dataSource = self;
    _table.alwaysBounceVertical = true;
    _table.showsVerticalScrollIndicator = true;
    _table.contentInset = UIEdgeInsetsMake(64,0,0,0);
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.table];
    
}


@end
