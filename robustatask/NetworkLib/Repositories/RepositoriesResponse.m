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
    if ([dictionary isKindOfClass:[NSDictionary class]])
    {
        Repository* repository = [[Repository alloc] init];
        [repository mapCustomFieldsfromDictionary:dictionary];
        self.repositories = [[NSArray alloc] initWithObjects:repository, nil];
    }
    else
    {
        NSArray* array = (NSArray*)dictionary;
        [self mapRepoList:array];
    }
}

-(void)mapRepoList:(NSArray*)repos
{
    NSMutableArray* parsedRepos = [[NSMutableArray alloc] init];
    for(NSDictionary* repo in repos)
    {
        Repository* repository = [[Repository alloc] init];
        [repository mapCustomFieldsfromDictionary:repo];
        [parsedRepos addObject:repository];
    }
    
    self.repositories = (NSArray*)parsedRepos;
}

@end
