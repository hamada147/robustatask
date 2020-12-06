//
//  ResponseBase.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "ResponseBase.h"
#import "LoggingManager.h"

@implementation ResponseBase
-(id)fromData
{
    NSError* error;
    NSDictionary* mappingDictionary = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:&error];
    if (error)
    {
        [LoggingManager logError:[NSString stringWithFormat:@"Error in converting response NSData to JSON dictionary for Response :%@", self]];
    }
    
    // NSDictionary* replacedDictionary = [self dictionaryByReplacingNullsWithStrings:mappingDictionary];
    @try
    {
        [self mapCustomFieldsfromDictionary:mappingDictionary];
    }
    @catch (NSException *exception)
    {
        [LoggingManager logError:[NSString stringWithFormat:@"Error in maping response dictionary to model for response %@", self]];
    }
    return self;
}

-(void)mapCustomFieldsfromDictionary:(NSDictionary*)dictionary
{
    [LoggingManager logError:@"ResponseBase mapCustomFieldsfromDictionary was called and it shouldn't"];
    NSLog(@"This shouldn't be called");
}

-(NSDictionary *)dictionaryByReplacingNullsWithStrings:(NSDictionary*)dictionary
{
    const NSMutableDictionary* replaced = [dictionary mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for(NSString *key in dictionary)
    {
        const id object = [dictionary objectForKey:key];
        if(object == nul)
        {
            [replaced setObject:blank forKey:key];
        }
    }
    return [replaced copy];
}

-(id)parseKey:(NSString*)key fromDictionary:(NSDictionary*)dictionary
{
    id value=[dictionary objectForKey:key];
    const id nul = [NSNull null];
    if (!(value == nul))
    {
        return value;
    }
    return nil;
}

-(NSString *)description
{
    if (self.data == nil)
    {
        [LoggingManager logError:[NSString stringWithFormat:@"Data variable is empty therefore we can't map nor parse it"]];
        return @"";
    }
    NSError* error;
    NSDictionary* mappingDictionary = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:&error];
    if (error)
    {
        return error.description;
    }
    return [mappingDictionary description];
}
@end
