//
//  Repository.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "RepositoryOwner.h"

NS_ASSUME_NONNULL_BEGIN

@interface Repository : NSObject

@property (nonatomic) int id;

@property (strong, nonatomic) NSString* nodeId;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* fullName;

@property (nonatomic) BOOL isPrivate;

@property (strong, nonatomic) RepositoryOwner* owner;

@property (strong, nonatomic) NSString* htmlURL;
@property (strong, nonatomic) NSString* repositoryDescription;

@property (nonatomic) BOOL isFork;

@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* forks_url;
@property (strong, nonatomic) NSString* keys_url;

@property (strong, nonatomic) NSString* collaborators_url;
@property (strong, nonatomic) NSString* teams_url;
@property (strong, nonatomic) NSString* hooks_url;

@property (strong, nonatomic) NSString* issue_events_url;
@property (strong, nonatomic) NSString* events_url;
@property (strong, nonatomic) NSString* assignees_url;

@property (strong, nonatomic) NSString* branches_url;
@property (strong, nonatomic) NSString* tags_url;
@property (strong, nonatomic) NSString* blobs_url;

@property (strong, nonatomic) NSString* git_tags_url;
@property (strong, nonatomic) NSString* git_refs_url;
@property (strong, nonatomic) NSString* trees_url;

@property (strong, nonatomic) NSString* statuses_url;
@property (strong, nonatomic) NSString* languages_url;
@property (strong, nonatomic) NSString* stargazers_url;

@property (strong, nonatomic) NSString* contributors_url;
@property (strong, nonatomic) NSString* subscribers_url;
@property (strong, nonatomic) NSString* subscription_url;

@property (strong, nonatomic) NSString* commits_url;
@property (strong, nonatomic) NSString* git_commits_url;
@property (strong, nonatomic) NSString* comments_url;

@property (strong, nonatomic) NSString* issue_comment_url;
@property (strong, nonatomic) NSString* contents_url;
@property (strong, nonatomic) NSString* compare_url;

@property (strong, nonatomic) NSString* merges_url;
@property (strong, nonatomic) NSString* archive_url;
@property (strong, nonatomic) NSString* downloads_url;

@property (strong, nonatomic) NSString* issues_url;
@property (strong, nonatomic) NSString* pulls_url;
@property (strong, nonatomic) NSString* milestones_url;

@property (strong, nonatomic) NSString* notifications_url;
@property (strong, nonatomic) NSString* labels_url;
@property (strong, nonatomic) NSString* releases_url;

@property (strong, nonatomic) NSString* deployments_url;
@property (strong, nonatomic) NSString* created_at;

-(void)mapCustomFieldsfromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
