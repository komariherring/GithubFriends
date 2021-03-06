//
//  APIController.m
//  GithubFriends
//
//  Created by Komari Herring on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "APIController.h"

@implementation APIController

-(void)searchGithubFor:(NSString *)searchTerm
{
    
    NSString *gitHubSearchTerm = [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *escapedSearchTerm = [gitHubSearchTerm stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/users/%@", escapedSearchTerm]];
    
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"Could not communicate to Github: %@", [error localizedDescription]);
                                          }
                                          else
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *gitHubResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                              [self.delegate didReceiveAPIResults:gitHubResponse];
                                          }
                                          
                                      }];
    
    [dataTask resume];
}


@end
