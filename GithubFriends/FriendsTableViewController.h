//
//  FriendsTableViewController.h
//  GithubFriends
//
//  Created by Komari Herring on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APIControllerProtocol

- (void)didReceiveAPIResults: (NSArray *)results; 

@end

@interface FriendsTableViewController : UITableViewController

@end
