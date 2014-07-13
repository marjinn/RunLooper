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
    
}
+(void)thisIsATestMethod;

@end

@implementation TrialAndErrorClass

+(void)thisIsATestMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end

int main(int argc, char * argv[])
{
    
    /*
     Check if a class responds to a Class method
    */
    BOOL doesRespond = NO;
    doesRespond =
    [[TrialAndErrorClass class] instancesRespondToSelector:@selector(thisIsATestMethod)];
    
    NSLog(@"%@",doesRespond ? @"YES" : @"NO"
          );
    
    @autoreleasepool
    {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
