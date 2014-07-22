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

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [[self class] getSelf:(id)self];
    }
    return self;
}

+(id)getSelf:(id)thisSelf
{
    return thisSelf;
}

+(void)thisIsATestMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [[[self alloc]init] setTrial:@"Google"];
}

-(void)thisIsAnotherTestMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
}

@end

int main(int argc, char * argv[])
{
    
    /**
     Invoke UIAlertView
     */
    //"UIAlertController"
    Class UIAlertController_class = nil;
    UIAlertController_class =
    NSClassFromString(@"UIAlertController");
    
//    + (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;

    SEL alertController = nil;
    alertController = @selector(alertControllerWithTitle:message:preferredStyle:);
    //NSSelectorFromString(@"alertControllerWithTitle:message:preferredStyle:");
    
    //alertController =  @selector(viewControllerWithRestorationIdentifierPath:coder:);
    
    NSMethodSignature* methodSign = nil;
    const char returnValEncode[2] = @encode(id);
    const char firstParamEncode[2] = @encode(id);
    const char secondParamEncode[2] = @encode(SEL);
    const char thirdParamEncode[2] = @encode(NSString*);
    const char fourthParamEncode[2] = @encode(NSString*);
    const char fifthParamEncode[2] = @encode(int);
    
    NSString* _string = nil;
    _string =
    [NSString stringWithFormat:@"%s%s%s%s%s%s",returnValEncode,firstParamEncode,secondParamEncode,thirdParamEncode,fourthParamEncode,fifthParamEncode];
    
    const char* types = NULL;
    types = [_string cStringUsingEncoding:NSUTF8StringEncoding];
    
    
   //methodSign = [[NSMethodSignature new ]methodSignatureForSelector:alertController];
   //methodSign = [NSMethodSignature signatureWithObjCTypes:"@@:@@i"];
    methodSign = [NSMethodSignature signatureWithObjCTypes:types];
    
    NSInvocation* invokeAlertController = nil;
    invokeAlertController =
    [NSInvocation invocationWithMethodSignature:methodSign];
    //invokeAlertController = [[NSInvocation alloc]init];
    
    
    [invokeAlertController setSelector:alertController];
    
    NSString* title = @"Blaah";
    NSString* message = @"Blaah";
    int prefferedStyle = 0;
    
    [invokeAlertController setArgument:(void *)&title atIndex:(NSInteger)2];
    [invokeAlertController setArgument:(void *)&message atIndex:(NSInteger)3];
    [invokeAlertController setArgument:(void *)&prefferedStyle atIndex:(NSInteger)4];
    
   
    [invokeAlertController invokeWithTarget:[NSClassFromString(@"UIAlertController") class]];
    
    id returnV = nil;
    [invokeAlertController getReturnValue:(void *)&returnV];
    
    
    TrialAndErrorClass* trial = nil;
    trial = [TrialAndErrorClass new];
    
    [trial setTrial:@"noo"];
    
    [[trial class]thisIsATestMethod];
    
    [trial thisIsAnotherTestMethod];
    /*
     Check if a class responds to an instanceMethod method
    */
    BOOL doesRespond = NO;
    doesRespond =
    [[TrialAndErrorClass class] instancesRespondToSelector:@selector(thisIsATestMethod)];
    
    NSMethodSignature* methodZ= nil;
    methodZ =
    [[TrialAndErrorClass class] instanceMethodSignatureForSelector:@selector(setTrial:)];
    
    NSInvocation* inocZ = nil;
    inocZ =
    [NSInvocation invocationWithMethodSignature:methodZ];
    
    NSString* string = @"google";
    [inocZ setArgument:(__bridge void *)(string) atIndex:(NSInteger)2];
    
    //[inocZ invokeWithTarget:[TrialAndErrorClass class]];
    [inocZ invoke];
    
    
    
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
