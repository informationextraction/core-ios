//
//  RCSIEventScreensaver.m
//  RCSIphone
//
//  Created by kiodo on 12/03/12.
//  Copyright 2012 HT srl. All rights reserved.
//

#import "RCSIEventScreensaver.h"
#import "RCSIEventManager.h"
#import "RCSICommon.h"

@implementation RCSIEventScreensaver

@synthesize isDeviceLocked;

- (id)init
{
  self = [super init];
  
  if (self != nil)
    {
      isDeviceLocked = EVENT_STANDBY_UNDEF;
      eventType = EVENT_STANDBY;
    }
    
  return  self;
}

- (BOOL)readyToTriggerStart
{
  if (isDeviceLocked == EVENT_STANDBY_LOCK)
    return TRUE;
  else
    return FALSE;
}

- (BOOL)readyToTriggerEnd
{
  if (isDeviceLocked == EVENT_STANDBY_UNLOCK)
    return TRUE;
  else
    return FALSE;
}

//- (void)setStartTimer
//{
//  // do notihing: the timer is inserted in runloop by RCSIEventManager processEvent
//  //              by postSetStartTimer
//}
//
//- (void)tryTriggerRepeat:(NSTimer*)aTimer
//{
//  if (isDeviceLocked == TRUE)
//    {
//      if ([self isEnabled] == TRUE)
//        {
//          [self triggerAction: [repeat intValue]];
//        }
//      
//      if (currIteration > 0)
//        {
//          currIteration--;    
//          [self setRepeatTimer];
//        }  
//      else if (currIteration == 0)
//        {
//          currIteration = (iter == nil ? 0xFFFFFFFF : ([iter intValue] - 1));
//          // set to endEndTimer done by setStandByTimer
//        }
//      else if (currIteration == 0xFFFFFFFF) 
//        {
//          [self setRepeatTimer];
//        }
//    }
//  else
//    {
//      currIteration = (iter == nil ? 0xFFFFFFFF : [iter intValue]);
//      if (currIteration > 0)
//        currIteration--;
//      [self setEndTimer];
//    }
//}
//
//- (void)setStandByTimer
//{  
//  NSTimeInterval theDelay = 1.00;
//  
//  if (isDeviceLocked == FALSE)
//    {
//      currIteration = (iter == nil ? 0xFFFFFFFF : [iter intValue]);
//      if (currIteration > 0)
//        currIteration--;
//      
//      [self addTimer:startTimer withDelay: theDelay andSelector:@selector(tryTriggerStart:)];
//      isDeviceLocked = TRUE;
//    }
//  else if (isDeviceLocked == TRUE)
//    {
//      [self addTimer:endTimer withDelay: theDelay andSelector:@selector(tryTriggerStart:)];
//      isDeviceLocked = FALSE;
//    }
//  return;
//}


@end