//
//  AlarmViewController.h
//  arealvis
//
//  Created by Sergio Kuhs on 03.01.13.
//
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) NSDictionary *imageData;

@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;


@end
