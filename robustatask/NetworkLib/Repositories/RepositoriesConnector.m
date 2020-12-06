//
//  RepositoriesConnector.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "RepositoriesConnector.h"
#import "RepositoriesRequest.h"
#import "RepositoriesResponse.h"

@implementation RepositoriesConnector

-(void)getRepositories:(int)since
{
    RepositoriesRequest* request = [[RepositoriesRequest alloc] initWithSince:since];
    [self processRequest:request];
}

-(ResponseBase*)createResponseFor:(RequestBase*)request
{
    if ([request isKindOfClass:[RepositoriesRequest class]])
    {
        return [[RepositoriesResponse alloc] init];
    }
    else
    {
        return [[ResponseBase alloc] init];
    }
}

@end
