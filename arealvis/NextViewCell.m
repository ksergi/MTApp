//
//  NextViewCell.m
//  arealvis
//
//  Created by Sergio Kuhs on 13.12.12.
//
//
#define MAINLABEL_TAG 1
#define SECONDLABEL_TAG 2
#define PHOTO_TAG 3


#import "NextViewCell.h"

@implementation NextViewCell

@synthesize nameLabel;
@synthesize textField;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        nameLabel = [[UILabel alloc] init];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.tag = 1;
        
        textField = [[UITextField alloc] init];
        textField.textAlignment = NSTextAlignmentLeft;
        textField.font = [UIFont systemFontOfSize:15];
        textField.tag = 2;
        
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:textField];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    
    frame= CGRectMake(boundsX+10 ,5, 200, 25);
    nameLabel.frame = frame;
    
    frame= CGRectMake(boundsX+10 ,30, 200, 15);
    textField.frame = frame;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



@end
