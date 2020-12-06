//
//  RepositoryOwner.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "RepositoryOwner.h"

@implementation RepositoryOwner
-(void)mapCustomFieldsfromDictionary:(NSDictionary*)dictionary
{
    self.login = [dictionary objectForKey:@"login"];
    self.id = [[dictionary objectForKey:@"id"] intValue];
    self.nodeId = [dictionary objectForKey:@"node_id"];
    self.avatarURL = [dictionary objectForKey:@"avatar_url"];
    self.gravatarId = [dictionary objectForKey:@"gravatar_id"];
    
    self.url = [dictionary objectForKey:@"url"];
    self.htmlURL = [dictionary objectForKey:@"html_url"];
    self.followersURL = [dictionary objectForKey:@"followers_url"];
    self.followingURL = [dictionary objectForKey:@"following_url"];
    self.gistsURL = [dictionary objectForKey:@"gists_url"];
    
    self.starredURL = [dictionary objectForKey:@"starred_url"];
    self.subscriptionsURL = [dictionary objectForKey:@"subscriptions_url"];
    self.organizationsURL = [dictionary objectForKey:@"organizations_url"];
    self.reposURL = [dictionary objectForKey:@"repos_url"];
    self.eventsURL = [dictionary objectForKey:@"events_url"];
    self.receivedEventsURL = [dictionary objectForKey:@"received_events_url"];
    self.type = [dictionary objectForKey:@"type"];
    
    self.siteAdmin = [[dictionary objectForKey:@"site_admin"] boolValue];
}
@end
