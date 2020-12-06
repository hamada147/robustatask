//
//  RequestBase.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "RequestBase.h"
#import "Constants.h"

@implementation RequestBase
{
    NSDictionary *customFields;
}

-(id)init
{
    self = [super init];
    self.httpHeaders = [[NSMutableDictionary alloc] init];
    return self;
}

-(NSURL*)getRequestFullUrl
{
    return [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", baseURL, self.restMethodName]];
}

-(NSDictionary*)getCustomFieldsDictionary
{
    return Nil;
}

-(NSData*) toData
{
    NSMutableDictionary* info = [[NSMutableDictionary alloc]init];
    customFields = [self getCustomFieldsDictionary];
    if (customFields != Nil) {
        [info addEntriesFromDictionary:customFields];
    }
    NSError *err;
    NSData* data = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:&err];
    return data;
}

-(NSString *)description
{
    if (customFields)
    {
        return [customFields description];
    }
    else
    {
        NSDictionary* fields = [self getCustomFieldsDictionary];
        if (fields)
        {
            return [fields description];
        }
    }
    return @"";
}

@end
