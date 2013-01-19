//
//  AlarmViewController.m
//  arealvis
//
//  Created by Sergio Kuhs on 03.01.13.
//
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@end

@implementation AlarmViewController

@synthesize ImageView, imageData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {

    if (self.imageData) {
        
        NSString *imgLink = [self.imageData objectForKey:@"link"];
        NSString *xChord= [self.imageData objectForKey:@"xCord"];
        NSString *yChord= [self.imageData objectForKey:@"yCord"];
        NSString *height= [self.imageData objectForKey:@"height"];
        NSString *width= [self.imageData objectForKey:@"width"];
         NSString *dateTime= [self.imageData objectForKey:@"date"];
        
        
        NSURL* imageFile = [NSURL URLWithString:imgLink]
        ;
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageFile]];
        
        CGRect imageRect = CGRectMake([xChord intValue], [yChord intValue], [width intValue],[height intValue]);
        
        UIImage *imageWithBox = [self imageByDrawingBoxOnImage:image withCGRect:&imageRect];
        
        self.ImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.ImageView.image = imageWithBox;
        self.dateTimeLabel.text = dateTime;
        
    }
    else {
        
        NSLog(@"imageData leer");
        
    }

}


- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(incomingNotification:) name:@"AlarmReceived" object:nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIImage *)imageByDrawingBoxOnImage:(UIImage *)image withCGRect:(CGRect *) imageRect
{
	// begin a graphics context of sufficient size
	UIGraphicsBeginImageContext(image.size);
	[image drawAtPoint:CGPointZero];
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	[[UIColor redColor] setStroke];
    CGContextStrokeRect(ctx, *imageRect);
	UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return retImage;
}

- (void) incomingNotification:(NSNotification *)notification{
    
    NSLog(@"notif received %@", [notification.object objectForKey:@"link"]);
   self.imageData = notification.object;

}

@end
