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

@interface RootView () <ViewControllerProtocol,LeftViewControllerProtocol, UIGestureRecognizerDelegate>

@property (nonatomic , retain)ViewController * centerViewController;
@property (nonatomic , retain)LeftViewController * leftViewController;
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
    if (self.leftViewController == nil)
    {
        self.leftViewController = [[LeftViewController alloc] init];
        self.leftViewController.view.tag = LEFT_PANEL_TAG;
        self.leftViewController.delegate = self;
        
        [self.view addSubview:self.leftViewController.view];
        [self addChildViewController:_leftViewController];
        [_leftViewController didMoveToParentViewController:self];
        _leftViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    self.showingLeftPanel = YES;
    // setup view shadows
    //[self showCenterViewWithShadow:YES withOffset:-2];
    UIView *view = self.leftViewController.view;
    return view;
}


-(void)showSideView {
    UIView *childView = [self getSideView];
    [self.view sendSubviewToBack:childView];
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _centerViewController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
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
                          
                             [self.leftViewController.view removeFromSuperview];
                             [self.leftViewController removeFromParentViewController];
                             self.leftViewController = nil;
                             NSLog(@"%@",[self description]);
                         }
                     }];
}



-(NSString*)description{
    return [NSString stringWithFormat:@"ROOT VIEW SWITCHED TO VIEW: %li \nCurrent View Values are CenterView:%@",(long)_currentView,_leftViewController];
}


@end
