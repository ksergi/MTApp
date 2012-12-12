//
//  draw2D.m
//  arealvis
//
//  Created by Sergio Kuhs on 24.11.12.
//
//

#import "draw2D.h"
#import <CoreImage/CoreImage.h>
#import <ImageIO/ImageIO.h>
#import <ImageIO/CGImageProperties.h>

@implementation draw2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CIContext *cicontext = [CIContext contextWithOptions:nil];
    NSDictionary  *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh
                                                      forKey:CIDetectorAccuracy];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:cicontext
                                              options:opts];
    
    NSString* file =[[NSBundle mainBundle] pathForResource:@"sergi" ofType:@"jpg"];
    NSURL* imageFile = [NSURL fileURLWithPath:file];
    
    CIImage* ciImage = [CIImage imageWithContentsOfURL:imageFile];
    
    CIImage *scaleImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(0.12, 0.119)];
    
    CIFilter *filter =   [CIFilter filterWithName:@"CISepiaTone"]; //   CIStretchCrop
    
    [filter setValue:scaleImage forKey:kCIInputImageKey];
    
    [filter setValue:[NSNumber numberWithFloat:0.8f] forKey:@"InputIntensity"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [cicontext createCGImage:result fromRect:[result extent]];
    
    ciImage = [CIImage imageWithCGImage:cgImage];
    
    
    
    //   [opts setValue: [NSString stringWithFormat:@"1"] forKey:CIDetectorImageOrientation];
    
    NSArray *features = [detector featuresInImage:ciImage options:opts];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIImage *myImage = [UIImage imageWithCIImage:ciImage];
    
    CGRect imageRect = CGRectMake(0, 0, 320, 411);
    
    [myImage drawInRect:imageRect];
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    for (CIFaceFeature *f in features)
    {
        printf("boundingbox origin %g %g \n", f.bounds.origin.x, f.bounds.origin.y );
        printf("boundingbox size %g %g \n", f.bounds.size.height, f.bounds.size.width );
        
        CGRect rectangle = f.bounds;
        
        CGContextAddRect(context, rectangle);
        
        CGContextStrokePath(context);
        
        
        
        if (f.hasLeftEyePosition)
            printf("Left eye %g %g\n", f.leftEyePosition.x,
                   f.leftEyePosition.y);
        if (f.hasRightEyePosition)
            printf("Right eye %g %g\n", f.rightEyePosition.x,
                   f.rightEyePosition.y);
        if (f.hasMouthPosition)
            printf("Mouth %g %g\n", f.mouthPosition.x,
                   f.mouthPosition.y);
        
        
    }

    
    
    
    
    
    
    
    NSLog(@"stop");
    
 }


@end
