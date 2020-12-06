//
//  RepositoriesResponse.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "ResponseBase.h"

#ifndef RepositoriesResponse_h
#define RepositoriesResponse_h

@interface RepositoriesResponse : ResponseBase

@property (nonatomic,strong) NSArray* repositories;

-(void)mapCustomFieldsfromDictionary:(NSDictionary*)dictionary;

@end

#endif /* RepositoriesResponse_h */
