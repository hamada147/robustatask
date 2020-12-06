//
//  RepositoryOwner.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>

#ifndef RepositoryOwner_h
#define RepositoryOwner_h

@interface RepositoryOwner : NSObject

@property (strong, nonatomic) NSString* login;
@property (nonatomic) int id;
@property (strong, nonatomic) NSString* nodeId;
@property (strong, nonatomic) NSString* avatarURL;
@property (strong, nonatomic) NSString* gravatarId;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* htmlURL;
@property (strong, nonatomic) NSString* followersURL;
@property (strong, nonatomic) NSString* followingURL;
@property (strong, nonatomic) NSString* gistsURL;
@property (strong, nonatomic) NSString* starredURL;
@property (strong, nonatomic) NSString* subscriptionsURL;
@property (strong, nonatomic) NSString* organizationsURL;
@property (strong, nonatomic) NSString* reposURL;
@property (strong, nonatomic) NSString* eventsURL;
@property (strong, nonatomic) NSString* receivedEventsURL;
@property (strong, nonatomic) NSString* type;
@property (nonatomic) BOOL siteAdmin;

-(void)mapCustomFieldsfromDictionary:(NSDictionary*)dictionary;
@end

#endif /* RepositoryOwner_h */
