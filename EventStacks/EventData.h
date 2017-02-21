//
//  EventData.h
//  EventStacks
//
//  Created by Joe Manto on 2/19/17.
//  Copyright © 2017 Joe Manto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventData : NSObject

- (id)initWithData:(NSString*)name withEventDate:(NSDate *)date withEventTime:(NSString*)time withNotifyDate:(NSDate*)notifyDate withNotifyTime:(NSString*)notfiyTime;

- (NSString*)getEventName;

- (NSDate*)getEventDate;

- (NSString*)getEventTime;

- (NSDate*)getEventNotifyDate;

- (NSString*)getEventNotifyTime;

- (void)setEventName:(NSString*)name;

- (void)setEventDate:(NSDate*)date;

- (void)setEventTime:(NSString*)time;

- (void)setEventNotifyDate:(NSDate*)date;

- (void)setEventNotifyTime:(NSString*)time;

@end


