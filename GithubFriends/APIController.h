//
//  APIController.h
//  GithubFriends
//
//  Created by Komari Herring on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendsTableViewController.h"

@interface APIController : NSObject

@property (strong, nonatomic) id<APIControllerProtocol> delegate;

- (void)searchGithubFor:(NSString *)searchTerm;

@end
