//
//  getXML.m
//  arealvis
//
//  Created by Sergio Kuhs on 01.01.13.
//
//

#import "getXML.h"
#import "AppDelegate.h"
#import "ConfigViewController.h"

#define SERVER_URL @"http://192.168.1.4/arealvis_config.xml"

@implementation getXML

-(void)receiveString {
    
    NSURL *url = [NSURL URLWithString:SERVER_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *getFile = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    if (getFile) {
        
        _receivedData = [NSMutableData data];
        
    } else {
        
        UIAlertView *connectFailMessage = [[UIAlertView alloc] initWithTitle:@"NSURLConnection " message:@"Failed in viewDidLoad"  delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[connectFailMessage show];
    }
}

#pragma mark NSURLConnection methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *didFailWithErrorMessage = [[UIAlertView alloc] initWithTitle: @"NSURLConnection " message: @"didFailWithError"  delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [didFailWithErrorMessage show];
    
    //inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey: NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

    _xmlString =  [[NSString alloc] initWithData:_receivedData encoding:NSASCIIStringEncoding];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
    
    NSError *error;
    BOOL succeed = [_xmlString writeToFile:[documentsDirectory stringByAppendingPathComponent:@"config.xml"]
                              atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!succeed){
        // Handle error here
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"xmlsavefinished" object:nil];
}
@end
