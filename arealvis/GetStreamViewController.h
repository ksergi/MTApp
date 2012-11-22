//
//  GetStreamViewController.h
//  arealvis
//
//  Created by Sergio Kuhs on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetStreamViewController : UIViewController

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) IBOutlet UIWebView *webView;

-(IBAction) playMovie;

@end
