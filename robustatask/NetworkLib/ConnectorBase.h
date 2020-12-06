//
//  ConnectorBase.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "ConnectorDelegate.h"
#import "ResponseBase.h"
#import "RequestBase.h"

#ifndef ConnectorBase_h
#define ConnectorBase_h

@interface ConnectorBase : NSObject<NSURLConnectionDelegate>
@property (nonatomic,strong) id<ConnectorDelegate> delegate;
@property (nonatomic,strong) ResponseBase* response;
@property (nonatomic,strong) RequestBase* request;

-(id)initWithDelegate:(id)delegate;
-(ResponseBase*)createResponseFor:(RequestBase*)request;
-(NSData*)getRequestData:(RequestBase*)request;
-(void)processRequest:(RequestBase*)request;
@end

#endif /* ConnectorBase_h */
