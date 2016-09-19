//
//  Friend.m
//  GithubFriends
//
//  Created by Komari Herring on 9/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+ (Friend *)friendWithDictionary:(NSDictionary *)friendDict
{
    Friend *aFriend = nil;
    if (friendDict)
    {
        aFriend = [[Friend alloc] init];
        aFriend.name = friendDict[@"name"];
        aFriend.login = friendDict[@"login"];
        aFriend.location = friendDict[@"location"];
        aFriend.avatar_url = friendDict[@"avatar_url"];
        aFriend.public_repos = friendDict[@"public_repos"];
    }
    
    return aFriend;
}




@end

