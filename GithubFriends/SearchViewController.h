//
//  SearchViewController.h
//  GithubFriends
//
//  Created by Komari Herring on 9/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsTableViewController.h"

@interface SearchViewController : UIViewController

@property (nonatomic) id<SearchTextFieldDelegate> delegate;

@end
