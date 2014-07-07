//
//  CQMTwistedRunLoop.h
//  Thread-OBJC
//
//  Created by mar Jinn on 7/4/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQMTwistedRunLoop: NSObject
{
    
}

-(void)theThread;

@end



@interface RunLoopSource: NSObject
{
    CFRunLoopSourceRef runLoopSource;
    NSMutableArray* commands;
}

-(instancetype)init;
-(void)addToCurrentRunLoop;
-(void)invalidate;

//handler method
-(void)sourceFired;

//Client interface for registering commands to process
-(void)addCommand:(NSInteger)command withData:(id)data;
-(void)fireAllCommandsOnRunLoop:(CFRunLoopRef)runLoop;
@end


// These are the CFRunLoopSourceRef callback functions.
void RunLoopSourceScheduleRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);
void RunLoopSourcePerformRoutine (void *info);
void RunLoopSourceCancelRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);


// RunLoopContext is acontainer object used during registration of
// the input source
@interface RunLoopContext : NSObject

{
    CFRunLoopRef runLoop;
    RunLoopSource* source;
}

@property(readonly)CFRunLoopRef runLoop;
@property(readonly)RunLoopSource* source;

-(instancetype)initWithSource:(RunLoopSource*)src andLoop:(CFRunLoopRef)loop;

@end