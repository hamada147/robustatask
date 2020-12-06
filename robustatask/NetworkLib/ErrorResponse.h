//
//  ErrorResponse.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>

#ifndef ErrorResponse_h
#define ErrorResponse_h

@interface ErrorResponse : NSObject
@property (nonatomic) BOOL* isSuccess;
@property (strong, nonatomic) NSString* errorMessage;

-(id)initWith:(NSString*)error;
@end

#endif /* ErrorResponse_h */
