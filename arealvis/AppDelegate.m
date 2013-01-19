//
//  AppDelegate.m
//  arealvis
//
//  Created by Sergio Kuhs on 27.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "AppDelegate.h"
#import "ConfigViewController.h"
//#import "xmlParser.h"
#import "DDXML.h"
#import "Reachability.h"
#import "getXML.h"
#import "AlarmViewController.h"


@implementation AppDelegate

@synthesize xmlString;

@synthesize window = _window;


-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    getXML *myXMl = [getXML alloc];
    [myXMl receiveString];
    return YES;
} 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSDictionary *pushNotificationPayload = [launchOptions valueForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if(pushNotificationPayload) {
        [self application:application didReceiveRemoteNotification:pushNotificationPayload];
    }
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    
    if (networkStatus == NotReachable) {
        [self showConfirmAlert];
        NSLog(@"There IS NO internet connection");
    } else {
        

        
        UITabBarController *tabBarController =
        (UITabBarController *)self.window.rootViewController;
        UINavigationController *navigationController =
        [[tabBarController viewControllers] objectAtIndex:0];
        [[navigationController viewControllers] objectAtIndex:0];
    
    }
            // Add registration for remote notifications
        [[UIApplication sharedApplication]
         registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)showConfirmAlert {
	UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:@"No VPN Alert"];
	[alert setMessage:@"You are not connected to the ArealVis VPN! \n Please establish a VPN connection first!"];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"OK"];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=TWITTER"]];
        NSLog(@"chancel");
        
    }
	else if (buttonIndex == 1)
	{
        NSLog(@"settings open");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General&path=Network"]];
        
	}
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	NSLog(@"My token is: %@", deviceToken);
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

-(void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
{
 
    UITabBarController *tabBarController =
    (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController =
    [[tabBarController viewControllers] objectAtIndex:0];
    [[navigationController viewControllers] objectAtIndex:0];
    
    [tabBarController setSelectedIndex:2];
    [[NSNotificationCenter defaultCenter] postNotificationName: @"AlarmReceived" object:userInfo];
}

@end
