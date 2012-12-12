//
//  AlertViewController.m
//  arealvis
//
//  Created by Sergio Kuhs on 23.11.12.
//
//

#import "AlertViewController.h"
#import <CoreImage/CoreImage.h>
#import <ImageIO/ImageIO.h>
#import <ImageIO/CGImageProperties.h>

@interface AlertViewController ()

@end

@implementation AlertViewController

@synthesize myImage;//, myImageView;

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
    [super viewDidLoad];
    
//    CIContext *context = [CIContext contextWithOptions:nil];
//    NSDictionary  *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh
//                                                      forKey:CIDetectorAccuracy];
//    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
//                                              context:context
//                                              options:opts];
//    
//    NSString* file =[[NSBundle mainBundle] pathForResource:@"sergi" ofType:@"jpg"];
//    NSURL* imageFile = [NSURL fileURLWithPath:file];
//    
//    CIImage* ciImage = [CIImage imageWithContentsOfURL:imageFile];
//    
//    
// //   [opts setValue: [NSString stringWithFormat:@"1"] forKey:CIDetectorImageOrientation];
//    
//    NSArray *features = [detector featuresInImage:ciImage options:opts];
//    
//    
//    for (CIFaceFeature *f in features)
//    {
//        
//        
//        printf("boundingbox origin %g %g \n", f.bounds.origin.x, f.bounds.origin.y );
//        printf("boundingbox size %g %g \n", f.bounds.size.height, f.bounds.size.width );
//
//        
//        if (f.hasLeftEyePosition)
//            printf("Left eye %g %g\n", f.leftEyePosition.x,
//                   f.leftEyePosition.y);
//        if (f.hasRightEyePosition)
//            printf("Right eye %g %g\n", f.rightEyePosition.x,
//                   f.rightEyePosition.y);
//        if (f.hasMouthPosition)
//            printf("Mouth %g %g\n", f.mouthPosition.x,
//                   f.mouthPosition.y);
//        
//        
//    }
//    
//    myImage = [UIImage imageWithCIImage:ciImage];
   // [myImageView setImage:myImage];
    
    
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
  
    [super viewDidUnload];
}
@end
