//
//  xmlParser.m
//  parser
//
//  Created by Sergio Kuhs on 22.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "xmlParser.h"
#import "DDXML.h"

@implementation xmlParser


-(NSArray *) withXPath:(NSString *)xPath{
    NSError *error = nil;
    
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString* configfile = [documentsPath stringByAppendingPathComponent:@"config.xml"];
    
    if (configfile) {
  
        
        
        self.content = [NSString stringWithContentsOfFile:configfile encoding:NSASCIIStringEncoding error:&error];
    }
    _theDocument = [[DDXMLDocument alloc] initWithXMLString:self.content options:0 error:&error];
    
   _results = [_theDocument nodesForXPath:xPath error:&error];
    
    return _results;

}



@end
