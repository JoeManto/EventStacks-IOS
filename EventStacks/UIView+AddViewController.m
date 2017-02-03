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
@property (strong,nonatomic) NSMutableArray *keys;

@end


@implementation AddViewController 

- (void)viewDidLoad {

    
    _data = [[NSMutableDictionary alloc]init];
    [_data setObject:@"THIS IS THE NAME" forKey:@"EventName"];
    [_data setObject:[NSDate date] forKey:@"EventDate"];
    [_data setObject:@"3:00PM 5/19/16" forKey:@"EventTime"];
    [_data setObject:@0 forKey:@"ShouldNotify"];
    
    NSMutableArray *insideArray = [[NSMutableArray alloc] init];
    _keys = [[NSMutableArray alloc]init];
    [_keys addObject:insideArray];
    [insideArray addObject:@"sss"];
    [insideArray addObject:@"ssssss"];
    [_keys addObject:@"xxxx"];
    [_keys addObject:@"xxxxxxx"];
    
    
    
    //NSMutableArray *insideArray = [[NSMutableArray alloc] initWithObjects:@"EventName",@"EventDate",@"EventTime",nil];
    //_keys = [[NSMutableArray alloc] initWithObjects:@"ShouldNotify",@"NotifyTime", nil];
    
    
    NSLog(@"%@",_keys);

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
        if(_data.count == 5){
            return 2;
        }else{
            return 1;
        }
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"cellIdentifier";
    UIView * cv;
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        CGRect contentViewFrame = cell.contentView.frame;
        contentViewFrame.size.width = _table.frame.size.width;
        cell.contentView.frame = contentViewFrame;
       
    }
    cv = cell.contentView;
   /* if(indexPath.section != 1){
        cell.textLabel.text = [_keys objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [_keys objectAtIndex:indexPath.row+3];
    }
    */
  
    /*
    if([[_data objectForKey:[_keys objectAtIndex:indexPath.row]] isKindOfClass:[NSString class]]){
        NSString * string = [_data objectForKey:[_keys objectAtIndex:indexPath.row]];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, -25, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",string];
        [cv addSubview:dataLabel];
    }else if([[_data objectForKey:[_keys objectAtIndex:indexPath.row]] isKindOfClass:[NSDate class]]){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSDate * date = [_data objectForKey:[_keys objectAtIndex:indexPath.row]];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, -25, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:date]];
        [cv addSubview:dataLabel];
    }else if([[_data objectForKey:[_keys objectAtIndex:indexPath.row]] isKindOfClass:[NSNumber class]]){
        NSNumber * number =  [_data objectForKey:[_keys objectAtIndex:indexPath.row]];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, -25, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",number];
        
        UISwitch *notifySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(180, -25, 0, 0)];
        [notifySwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
        [cv addSubview:notifySwitch];
    }
    */
    /*
    if([_dataArray[indexPath.section][indexPath.row] isKindOfClass:[NSString class]]){
        NSString * string = _dataArray[indexPath.section][indexPath.row];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(cv.frame.size.width-100, -cv.frame.size.height/2, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",string];
        [cv addSubview:dataLabel];
    }else if([_dataArray[indexPath.section][indexPath.row] isKindOfClass:[NSDate class]]){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSDate * date = _dataArray[indexPath.section][indexPath.row];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(cv.frame.size.width-100, -cv.frame.size.height/2, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:date]];
        [cv addSubview:dataLabel];
    }else if([_dataArray[indexPath.section][indexPath.row] isKindOfClass:[NSNumber class]]){
        NSNumber * number = _dataArray[indexPath.section][indexPath.row];
        UILabel * dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(cv.frame.size.width-100, -cv.frame.size.height/2, 200, 100)];
        dataLabel.text = [NSString stringWithFormat:@"%@",number];
        
        UISwitch *notifySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(cv.frame.size.width-100, cv.frame.size.height/2-13, 0, 0)];
        [notifySwitch addTarget:self action:@selector(switchToggled:) forControlEvents: UIControlEventTouchUpInside];
        [cv addSubview:notifySwitch];
    }

    */
    
    
    
    /*
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
   */
  
   /* if(indexPath.row != 2){
         UIImageView *seperatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(15, cell.frame.size.height+5, cell.frame.size.width, 0.5)];
         [seperatorLine setBackgroundColor:[UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0]];
         [cell addSubview:seperatorLine];
    }
    */
    
   // NSLog(@"index section %ld index row %ld",indexPath.section,indexPath.row);
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    
    EditSelectedView * editingView = [[EditSelectedView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height/2-150, 300, 300)];
    [self.view addSubview:editingView];
    */
}


-(void)switchToggled:(id)selctor{
    
    
        NSArray *insertIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:1],nil];
        [_table beginUpdates];
    
        //[_table insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationRight];
        
        [_table insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationLeft];
        [_table reloadData];
        [_table endUpdates];
      
        
        
        //[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].translatesAutoresizingMaskIntoConstraints = YES;
        /*[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].frame = CGRectMake(
                                                                        _table.frame.size.width/2, _table.frame.size.width/2, 200, 200);*/
    
        
        //NSLog(@"Size After: %f", [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].contentView.frame.size.height);
      
        NSArray *deleteIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:1 inSection:1],nil];
        [_table beginUpdates];
        
        [_table deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationRight];
       // [[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]] removeFromSuperview];
        
        [_table endUpdates];
        
        
        
        
        //[NSLog(@"%@",[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]]);
        //_table.contentSize = tableView.sizeThatFits(CGSize(width: tableView.bounds.size.width, height: CGFloat.max))
        //[_table contentSize] = _table.Si
        NSLog(@"Size After: %f", [_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].contentView.frame.size.height);
    
    //NSLog(@" s %ld",[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].subviews.count);
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
    [_table setBackgroundColor:[UIColor whiteColor]];
    _table.delegate = self;
    _table.dataSource = self;
    _table.alwaysBounceVertical = true;
    _table.showsVerticalScrollIndicator = true;
    _table.contentInset = UIEdgeInsetsMake(64,0,0,0);
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.table];
    
}



@end
