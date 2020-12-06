//
//  RepositoriesRequest.m
//  testnetworkinObjc
//
//  Created by Moussa on 06/12/2020.
//

#import "RepositoriesRequest.h"

@implementation RepositoriesRequest

-(id)init
{
    self = [super init];
    if (self)
    {
        self.HTTPMethod = @"GET";
        self.restMethodName=@"repositories";
    }
    return self;
}

-(id)initWithSince:(int)since
{
    self = [super init];
    if (self)
    {
        self.HTTPMethod = @"GET";
        self.restMethodName = [NSString stringWithFormat:@"repositories?since=%d", since];
    }
    return self;
}

-(id)initWithId:(int)ID
{
    self = [super init];
    if (self)
    {
        self.HTTPMethod = @"GET";
        self.restMethodName = [NSString stringWithFormat:@"repositories/%d", ID];
    }
    return self;
}

@end
