//
//  ViewController.h
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 9/14/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerProtocol <NSObject>

@optional
- (void)showSideView;
- (void)showCenterView;
- (void)removeSideView;

@end

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, assign) id<ViewControllerProtocol> delegate;

@end

