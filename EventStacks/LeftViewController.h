//
//  LeftViewController.h
//  SlideOutMenuTemplate
//
//  Created by Joe Manto on 9/17/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftViewControllerProtocol <NSObject>

@end
@interface LeftViewController : UIViewController

@property (nonatomic, assign) id<LeftViewControllerProtocol> delegate;

@property (nonatomic,strong)NSString * people;
@end
