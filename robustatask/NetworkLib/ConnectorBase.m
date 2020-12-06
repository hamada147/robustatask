//
//  ConnectorBase.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "ConnectorBase.h"
#import "LoggingManager.h"

@implementation ConnectorBase

-(id)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

-(ResponseBase*)createResponseFor:(RequestBase*)request
{
    ResponseBase* response = [[ResponseBase alloc] init];
    return response;
}

-(NSData*)getRequestData:(RequestBase*)request
{
    return [request toData];
}

-(void)processRequest:(RequestBase*)request
{
    self.request = request;
    NSURL* url = [request getRequestFullUrl];
    NSMutableURLRequest *requestUrl = [[NSMutableURLRequest alloc] initWithURL:url];
    requestUrl.HTTPMethod = request.HTTPMethod;
    [requestUrl addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestUrl addValue:@"no-cache, no-store" forHTTPHeaderField:@"Cache-Control"];
    [requestUrl addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [requestUrl addValue:@"en_US" forHTTPHeaderField:@"Accept-Language"];
    [requestUrl addValue:@"iOS" forHTTPHeaderField:@"User-Agent"];
    
    if ([requestUrl.HTTPMethod isEqual:@"POST"])
    {
        [requestUrl setHTTPBody:[self getRequestData:request]];
    }
    
    NSURLSessionDataTask* task = [[NSURLSession sharedSession]
                                  dataTaskWithRequest:requestUrl
                                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            self.response = [self createResponseFor:self.request];
            self.response.data = (NSMutableData*)data;
            [self.response fromData];
            [self.delegate callCompleted:self.response];
        }
        else
        {
            ErrorResponse* errorObj = [[ErrorResponse alloc] init];
            errorObj.isSuccess = false;
            errorObj.errorMessage = error.localizedDescription;
            [LoggingManager logError:error.localizedDescription];
            [self.delegate callFailed:errorObj];
        }
    }];
    [task resume];
}

@end
