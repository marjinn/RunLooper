//
//  main.m
//  RunLooper
//
//  Created by mar Jinn on 7/8/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>

@interface TrialAndErrorClass : NSObject
{
    
    //NSString* trial;
}

@property NSString* trial;
+(void)thisIsATestMethod;
-(void)thisIsAnotherTestMethod;

@end

@implementation TrialAndErrorClass

+(void)thisIsATestMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

-(void)thisIsAnotherTestMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end

int main(int argc, char * argv[])
{
    TrialAndErrorClass* trial = nil;
    trial = [TrialAndErrorClass new];
    
    [trial setTrial:@"noo"];
    /*
     Check if a class responds to an instanceMethod method
    */
    BOOL doesRespond = NO;
    doesRespond =
    [[TrialAndErrorClass class] instancesRespondToSelector:@selector(thisIsATestMethod)];
    
    NSLog(@"%@",doesRespond ? @"YES" : @"NO"
          );
    
    /*
     Check if a class responds to a class method
     */
    BOOL doesRespondTo = NO;
    doesRespondTo =
    [[TrialAndErrorClass class] respondsToSelector:@selector(thisIsATestMethod)];
    
    NSLog(@"%@",doesRespond ? @"YES" : @"NO"
          );

    @autoreleasepool
    {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
