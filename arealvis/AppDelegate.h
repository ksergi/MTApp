//
//  AppDelegate.h
//  arealvis
//
//  Created by Sergio Kuhs on 27.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@class Reachability;
#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate> {

    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
    NSString *xmlString;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *xmlString;

- (void)showConfirmAlert;




@end
