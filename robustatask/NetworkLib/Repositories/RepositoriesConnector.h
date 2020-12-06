//
//  RepositoriesConnector.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import "ConnectorBase.h"

#ifndef RepositoriesConnector_h
#define RepositoriesConnector_h

@interface RepositoriesConnector : ConnectorBase
-(void)getRepositories:(int)since;
-(void)getRepoDetails:(int)ID;
-(ResponseBase*)createResponseFor:(RequestBase*)request;
@end

#endif /* RepositoriesConnector_h */
