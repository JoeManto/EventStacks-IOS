//
//  ViewController.m
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 9/14/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+CustomTableCell.h"
#import "UIView+EditSelectedView.h"

@interface ViewController ()


@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) UINavigationBar * navBar;

@end

NSArray * cellSections;

NSMutableDictionary *eventData;
NSMutableDictionary *eventData2;
NSMutableDictionary *event;
NSMutableDictionary *dayData;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    cellSections = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
   
    [self tableInit];
    
    eventData = [[NSMutableDictionary alloc]initWithObjects:@[@"5:00PM",@"9items",@"Beach Trip"] forKeys:@[@"time",@"numItems",@"tripName"]];
    eventData2 = [[NSMutableDictionary alloc]initWithObjects:@[@"6:00PM",@"20items",@"Friend's House"] forKeys:@[@"time",@"numItems",@"tripName"]];
    
    event = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  eventData,@"trip0",nil];
    
    dayData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    [event mutableCopy],@"Monday",nil];
 
    NSMutableDictionary *event2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 eventData2,@"trip1",nil];
    [[dayData objectForKey:@"Monday"] addEntriesFromDictionary:event2];
    
    //NSLog(@"%@",[[dayData objectForKey:@"Monday"]objectForKey:@"trip2"]);


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
    navItem.title = @"Events";
    
    //UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(yourMethod:)];
    //navItem.leftBarButtonItem = leftButton;
    
    //UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(yourOtherMethod:)];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(yourOtherMethod:)];
    rightButton.tintColor = [UIColor redColor];
    navItem.rightBarButtonItem = rightButton;
    
  

    _navBar.items = @[navItem];
    
    [self.view addSubview:_navBar];

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    UILabel * dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 200, 40)];
    dayLabel.text = [NSString stringWithFormat:@"%@",[cellSections objectAtIndex:section]];
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, tableView.bounds.size.width, 0.4)];
    line.backgroundColor = [UIColor colorWithRed:0.77 green:0.77 blue:0.77 alpha:1.0];
    [headerView addSubview:dayLabel];
    [headerView addSubview:line];

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [cellSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *sectionTitle = [cellSections objectAtIndex:section];
    NSArray *sectionData = [dayData objectForKey:sectionTitle];
   //NSLog(@"%ld , %@",[sectionData count],sectionTitle);
    return [sectionData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

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
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EditSelectedView * editingView = [[EditSelectedView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height/2-150, 300, 300)];
    [self.view addSubview:editingView];
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


/*
 NSMutableArray* newDays = [NSMutableArray arrayWithArray:sections];
 NSMutableArray* test = [[NSMutableArray alloc]init];
 [test addObject:[NSNumber numberWithInteger:3]];
 [test addObject:[NSNumber numberWithInteger:2]];
 [test addObject:[NSNumber numberWithInteger:1]];
 NSLog(@"%@",test);
 int j;
 NSNumber * temp;
 for(int i = 1;i < test.count;i++){
 j = i;
 NSLog(@"%@ with %@",[test objectAtIndex:j],[test objectAtIndex:j-1]);
 while(j>0 && ([test objectAtIndex:j] < [test objectAtIndex:j-1]) ){
 NSLog(@"hit");
 temp = [test objectAtIndex:j-1];
 [test replaceObjectAtIndex:j-1 withObject:[test objectAtIndex:j]];
 [test replaceObjectAtIndex:j withObject:temp];
 j--;
 }
 NSLog(@"%@",test);
 }
 */


@end
