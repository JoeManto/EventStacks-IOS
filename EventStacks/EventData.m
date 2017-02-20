//
//  EventData.m
//  EventStacks
//
//  Created by Joe Manto on 2/19/17.
//  Copyright © 2017 Joe Manto. All rights reserved.
//

#import "EventData.h"

@interface EventData ()

@end

@implementation EventData

NSString * eventName;
NSDate * eventDate;
NSString * eventTime;
NSDate * eventNotifyDate;
NSString * eventNotfiyTime;

- (id)initWithData:(NSString*)name withEventDate:(NSDate *)date withEventTime:(NSString*)time
    withNotifyDate:(NSDate*)notifyDate withNotifyTime:(NSString*)notfiyTime
{
    self = [super init];
    if (self) {
        eventName = name;
        eventDate = date;
        eventTime = time;
        eventNotifyDate = notifyDate;
        eventNotfiyTime = notfiyTime;
    }
    return self;
}
- (NSString*)getEventName
{
    return eventName;
}
- (NSDate*)getEventDate
{
    return eventDate;
}
- (NSString*)getEventTime
{
    return eventTime;
}
- (NSDate*)getEventNotifyDate;
{
    return eventNotifyDate;
}
- (NSString*)getEventNotifyTime;
{
    return eventNotfiyTime;
}
- (void)setEventName:(NSString*)name
{
    eventName = name;
}
- (void)setEventDate:(NSDate*)date
{
    eventDate = date;
}
- (void)setEventTime:(NSString*)time
{
    eventTime = time;
}
- (void)setEventNotifyDate:(NSDate*)date;
{
    eventNotifyDate = date;
}
- (void)setEventNotifyTime:(NSString*)time;
{
    eventNotfiyTime = time;
}
@end
