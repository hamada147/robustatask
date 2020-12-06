//
//  ErrorResponse.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "ErrorResponse.h"

@implementation ErrorResponse

-(id)initWith:(NSString*)error
{
    self = [super init];
    if (self)
    {
        self.isSuccess = false;
        self.errorMessage = error;
    }
    return self;
}

@end
