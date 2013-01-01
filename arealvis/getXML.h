//
//  getXML.h
//  arealvis
//
//  Created by Sergio Kuhs on 01.01.13.
//
//

#import <Foundation/Foundation.h>

@interface getXML : NSObject


@property(nonatomic, strong) NSString *xmlString;
@property(nonatomic, strong) NSMutableData *receivedData;

-(void) receiveString;


@end
