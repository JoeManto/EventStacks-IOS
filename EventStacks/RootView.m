//
//  RootView.m
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 9/14/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "RootView.h"

#define CENTER_TAG 1
#define LEFT_PANEL_TAG 2
#define LEFT_PANEL_THEME_TAG 3

#define CORNER_RADIUS 4
#define SLIDE_TIMING .25
#define PANEL_WIDTH 150


/*____________  __                 __   ____________   __       _
 /  __________| \ \               / /  /  __________| |  \     | |
 | |             \ \             / /   | |            |   \    | |
 | |              \ \           / /    | |            | |\ \   | |
 | |______         \ \         / /     | |_____       | | \ \  | |
 |  ______|         \ \       / /      |  _____|      | |  \ \ | |
 | |                 \ \     / /       | |            | |   \ \| |
 | |                  \ \   / /        | |            | |    \   |
 | |__________         \ \_/ /         | |__________  | |     \  |
 \____________|         \___/          \____________| |_|      \_|
*/
@interface RootView () <ViewControllerProtocol,AddViewControllerProtocol, UIGestureRecognizerDelegate>

@property (nonatomic , retain)ViewController * centerViewController;
@property (nonatomic , retain)AddViewController * AddViewController;
@property (nonatomic, assign) BOOL showingLeftPanel;
@property (nonatomic) NSInteger currentView;
@end


@implementation RootView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCenterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)setUpCenterView{
    self.centerViewController = [[ViewController alloc]init];
    self.centerViewController.view.tag = CENTER_TAG;
    self.centerViewController.delegate = self;
    [self.view addSubview:self.centerViewController.view];
    [self addChildViewController:_centerViewController];
    //[_centerViewController didMoveToParentViewController:self];
}

-(UIView *)getSideView {
    if (self.AddViewController == nil)
    {
        self.AddViewController = [[AddViewController alloc] init];
        self.AddViewController.view.tag = LEFT_PANEL_TAG;
        self.AddViewController.delegate = self;
        
        [self.view addSubview:_AddViewController.view];
        [self addChildViewController:_AddViewController];
        [_AddViewController didMoveToParentViewController:self];
        _AddViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    self.showingLeftPanel = YES;
    // setup view shadows
    //[self showCenterViewWithShadow:YES withOffset:-2];
    UIView *view = _AddViewController.view;
    return view;
}


-(void)showSideView {
    NSLog(@"worked");
    UIView *childView = [self getSideView];
    [self.view sendSubviewToBack:childView];
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _centerViewController.view.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             //self.centerViewController.menuTabButton.tag = 1;
                             _currentView = 1;
                             NSLog(@"%@",[self description]);
                             
                         }
                     }];
}

-(void)removeSideView {
    NSLog(@"logged");
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _centerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             //self.centerViewController.menuTabButton.tag = 1;
                             _currentView = 0;
                          
                             [_AddViewController.view removeFromSuperview];
                             [_AddViewController removeFromParentViewController];
                             _AddViewController = nil;
                             NSLog(@"%@",[self description]);
                         }
                     }];
}



-(NSString*)description{
    return [NSString stringWithFormat:@"ROOT VIEW SWITCHED TO VIEW: %li \nCurrent View Values are CenterView:%@",(long)_currentView,_AddViewController];
}


@end
