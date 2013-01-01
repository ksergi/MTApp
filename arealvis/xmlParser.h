//
//  xmlParser.h
//  parser
//
//  Created by Sergio Kuhs on 22.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDXML.h"

@interface xmlParser : NSObject {


}

@property(strong, nonatomic) NSString *content;
@property(strong, nonatomic) DDXMLDocument *theDocument;
@property(strong, nonatomic) NSArray *results;

-(NSArray *)withXPath:(NSString *) xPath;


@end
