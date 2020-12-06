//
//  Repository.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import "Repository.h"

@implementation Repository

-(void)mapCustomFieldsfromDictionary:(NSDictionary *)dictionary
{
    self.id = [[dictionary objectForKey:@"id"] intValue];
    
    self.nodeId = [dictionary objectForKey:@"node_id"];
    self.name = [dictionary objectForKey:@"name"];
    self.fullName = [dictionary objectForKey:@"full_name"];
    
    self.isPrivate = [[dictionary objectForKey:@"private"] boolValue];
    
    RepositoryOwner* owner = [[RepositoryOwner alloc] init];
    [owner mapCustomFieldsfromDictionary:[dictionary objectForKey:@"owner"]];
    self.owner = owner;
    
    self.htmlURL = [dictionary objectForKey:@"html_url"];
    self.repositoryDescription = [dictionary objectForKey:@"description"];
    
    self.isFork = [[dictionary objectForKey:@"fork"] boolValue];
    
    self.url = [dictionary objectForKey:@"url"];
    self.forks_url = [dictionary objectForKey:@"forks_url"];
    self.keys_url = [dictionary objectForKey:@"keys_url"];
    
    self.collaborators_url = [dictionary objectForKey:@"collaborators_url"];
    self.teams_url = [dictionary objectForKey:@"teams_url"];
    self.hooks_url = [dictionary objectForKey:@"hooks_url"];
    
    self.issue_events_url = [dictionary objectForKey:@"issue_events_url"];
    self.events_url = [dictionary objectForKey:@"events_url"];
    self.assignees_url = [dictionary objectForKey:@"assignees_url"];
    
    self.branches_url = [dictionary objectForKey:@"branches_url"];
    self.tags_url = [dictionary objectForKey:@"tags_url"];
    self.blobs_url = [dictionary objectForKey:@"blobs_url"];
    
    self.git_tags_url = [dictionary objectForKey:@"git_tags_url"];
    self.git_refs_url = [dictionary objectForKey:@"git_refs_url"];
    self.trees_url = [dictionary objectForKey:@"trees_url"];
    
    self.statuses_url = [dictionary objectForKey:@"statuses_url"];
    self.languages_url = [dictionary objectForKey:@"languages_url"];
    self.stargazers_url = [dictionary objectForKey:@"stargazers_url"];
    
    self.contributors_url = [dictionary objectForKey:@"contributors_url"];
    self.subscribers_url = [dictionary objectForKey:@"subscribers_url"];
    self.subscription_url = [dictionary objectForKey:@"subscription_url"];
    
    self.commits_url = [dictionary objectForKey:@"commits_url"];
    self.git_commits_url = [dictionary objectForKey:@"git_commits_url"];
    self.comments_url = [dictionary objectForKey:@"comments_url"];
    
    self.issue_comment_url = [dictionary objectForKey:@"issue_comment_url"];
    self.contents_url = [dictionary objectForKey:@"contents_url"];
    self.compare_url = [dictionary objectForKey:@"compare_url"];
    
    self.merges_url = [dictionary objectForKey:@"merges_url"];
    self.archive_url = [dictionary objectForKey:@"archive_url"];
    self.downloads_url = [dictionary objectForKey:@"downloads_url"];
    
    self.issues_url = [dictionary objectForKey:@"issues_url"];
    self.pulls_url = [dictionary objectForKey:@"pulls_url"];
    self.milestones_url = [dictionary objectForKey:@"milestones_url"];
    
    self.notifications_url = [dictionary objectForKey:@"notifications_url"];
    self.labels_url = [dictionary objectForKey:@"labels_url"];
    self.releases_url = [dictionary objectForKey:@"releases_url"];
    
    self.deployments_url = [dictionary objectForKey:@"deployments_url"];
    
    if ([dictionary objectForKey:@"created_at"] != nil)
    {
        self.created_at = [dictionary objectForKey:@"created_at"];
    }
    else
    {
        self.created_at = @"";
    }
}

@end
