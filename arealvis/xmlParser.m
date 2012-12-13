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
    NSString * content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"arealvis_config" ofType:@"xml"] encoding:NSUTF8StringEncoding error:&error]; 
    

    DDXMLDocument *theDocument = [[DDXMLDocument alloc] initWithXMLString:content options:0 error:&error];
    
    NSArray *results = [theDocument nodesForXPath:xPath error:&error];
    
    NSLog(@"xml read done");
    
    return results;
    
}





@end
