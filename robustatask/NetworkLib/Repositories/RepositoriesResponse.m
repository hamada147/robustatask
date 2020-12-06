//
//  RepositoriesResponse.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "RepositoriesResponse.h"
#import "Repository.h"

@implementation RepositoriesResponse

-(void)mapCustomFieldsfromDictionary:(NSDictionary*)dictionary
{
    NSArray* array = (NSArray*)dictionary;
    [self mapRepoList:array];
}

-(void)mapRepoList:(NSArray*)repos
{
    NSMutableArray* parsedRepos = [[NSMutableArray alloc] init];
    for(NSDictionary* repo in repos)
    {
        Repository* repository = [[Repository alloc] init];
        
        repository.id = [[repo objectForKey:@"id"] intValue];
        
        repository.nodeId = [repo objectForKey:@"node_id"];
        repository.name = [repo objectForKey:@"name"];
        repository.fullName = [repo objectForKey:@"full_name"];
        
        repository.isPrivate = [[repo objectForKey:@"private"] boolValue];
        
        RepositoryOwner* owner = [[RepositoryOwner alloc] init];
        [owner mapCustomFieldsfromDictionary:[repo objectForKey:@"owner"]];
        repository.owner = owner;
        
        repository.htmlURL = [repo objectForKey:@"html_url"];
        repository.repositoryDescription = [repo objectForKey:@"description"];
        
        repository.isFork = [[repo objectForKey:@"fork"] boolValue];
        
        repository.url = [repo objectForKey:@"url"];
        repository.forks_url = [repo objectForKey:@"forks_url"];
        repository.keys_url = [repo objectForKey:@"keys_url"];
        
        repository.collaborators_url = [repo objectForKey:@"collaborators_url"];
        repository.teams_url = [repo objectForKey:@"teams_url"];
        repository.hooks_url = [repo objectForKey:@"hooks_url"];
        
        repository.issue_events_url = [repo objectForKey:@"issue_events_url"];
        repository.events_url = [repo objectForKey:@"events_url"];
        repository.assignees_url = [repo objectForKey:@"assignees_url"];
        
        repository.branches_url = [repo objectForKey:@"branches_url"];
        repository.tags_url = [repo objectForKey:@"tags_url"];
        repository.blobs_url = [repo objectForKey:@"blobs_url"];
        
        repository.git_tags_url = [repo objectForKey:@"git_tags_url"];
        repository.git_refs_url = [repo objectForKey:@"git_refs_url"];
        repository.trees_url = [repo objectForKey:@"trees_url"];
        
        repository.statuses_url = [repo objectForKey:@"statuses_url"];
        repository.languages_url = [repo objectForKey:@"languages_url"];
        repository.stargazers_url = [repo objectForKey:@"stargazers_url"];
        
        repository.contributors_url = [repo objectForKey:@"contributors_url"];
        repository.subscribers_url = [repo objectForKey:@"subscribers_url"];
        repository.subscription_url = [repo objectForKey:@"subscription_url"];
        
        repository.commits_url = [repo objectForKey:@"commits_url"];
        repository.git_commits_url = [repo objectForKey:@"git_commits_url"];
        repository.comments_url = [repo objectForKey:@"comments_url"];
        
        repository.issue_comment_url = [repo objectForKey:@"issue_comment_url"];
        repository.contents_url = [repo objectForKey:@"contents_url"];
        repository.compare_url = [repo objectForKey:@"compare_url"];
        
        repository.merges_url = [repo objectForKey:@"merges_url"];
        repository.archive_url = [repo objectForKey:@"archive_url"];
        repository.downloads_url = [repo objectForKey:@"downloads_url"];
        
        repository.issues_url = [repo objectForKey:@"issues_url"];
        repository.pulls_url = [repo objectForKey:@"pulls_url"];
        repository.milestones_url = [repo objectForKey:@"milestones_url"];
        
        repository.notifications_url = [repo objectForKey:@"notifications_url"];
        repository.labels_url = [repo objectForKey:@"labels_url"];
        repository.releases_url = [repo objectForKey:@"releases_url"];
        
        repository.deployments_url = [repo objectForKey:@"deployments_url"];
        
        [parsedRepos addObject:repository];
    }
    
    self.repositories = (NSArray*)parsedRepos;
}

@end
