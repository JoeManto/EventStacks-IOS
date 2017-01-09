//
//  UIView+AddViewController.h
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 12/30/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddViewControllerProtocol <NSObject>

@end
@interface AddViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) id<AddViewControllerProtocol> delegate;

@end
