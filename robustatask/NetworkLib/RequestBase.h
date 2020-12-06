//
//  RequestBase.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>

#ifndef RequestBase_h
#define RequestBase_h

@interface RequestBase : NSObject

@property (strong,nonatomic) NSString* restMethodName;
@property (strong,nonatomic) NSMutableDictionary *httpHeaders;
@property (strong,nonatomic) NSString* HTTPMethod;

-(NSURL*)getRequestFullUrl;
-(NSData*)toData;
-(NSDictionary*)getCustomFieldsDictionary;

@end

#endif /* RequestBase_h */
