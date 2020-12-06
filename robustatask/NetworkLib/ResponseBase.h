//
//  ResponseBase.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>

#ifndef ResponseBase_h
#define ResponseBase_h

@interface ResponseBase : NSObject
@property (strong,nonatomic) NSMutableData* data;

-(id)fromData;
-(void)mapCustomFieldsfromDictionary:(NSDictionary*)dictionary;
-(id)parseKey:(NSString*)key fromDictionary:(NSDictionary*)dictionary;
-(NSDictionary*)dictionaryByReplacingNullsWithStrings:(NSDictionary*)dictionary;
@end

#endif /* ResponseBase_h */
