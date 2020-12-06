//
//  RepositoriesRequest.h
//  testnetworkinObjc
//
//  Created by Moussa on 06/12/2020.
//

#import <Foundation/Foundation.h>
#import "RequestBase.h"

@interface RepositoriesRequest : RequestBase
-(id)initWithSince:(int)since;
@end
