//
//  GetStreamViewController.m
//  arealvis
//
//  Created by Sergio Kuhs on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GetStreamViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface GetStreamViewController ()

@end

@implementation GetStreamViewController

@synthesize url, webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self playMovie];
    [super viewDidLoad];
 
	// Do any additional setup after loading the view.
}

- (void) playMovie {
    
    
    
    
    NSURL *StreamUrl = [NSURL URLWithString:self.url];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:StreamUrl]];
    

    

}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    MPMoviePlayerController *moviePlayer = [notification object];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self      
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayer];
    
    if ([moviePlayer 
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [moviePlayer.view removeFromSuperview];
    }
   
}

//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//}
//
//// Override to allow orientations other than the default portrait orientation.
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    // Return YES for supported orientations
//    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
//    return YES;
//}

@end
