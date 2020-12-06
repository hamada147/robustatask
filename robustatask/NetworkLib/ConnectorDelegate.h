//
//  ConnectorDelegate.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "ErrorResponse.h"

#ifndef ConnectorDelegate_h
#define ConnectorDelegate_h

@protocol ConnectorDelegate <NSObject>
-(void)callCompleted:(id)response;
-(void)callFailed:(ErrorResponse*)response;
@end


#endif /* ConnectorDelegate_h */

