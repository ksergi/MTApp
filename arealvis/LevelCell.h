//
//  LevelCell.h
//  arealvis
//
//  Created by Sergio Kuhs on 13.12.12.
//
//

#import <UIKit/UIKit.h>

@interface LevelCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *detailLabel;
@property (nonatomic, strong) IBOutlet UITextField *elementValueText;


@end
