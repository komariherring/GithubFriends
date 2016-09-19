//
//  FriendsTableViewController.m
//  GithubFriends
//
//  Created by Komari Herring on 8/3/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "SearchViewController.h"
#import "APIController.h"
#import "Friend.h"
#import "DetailViewController.h"

@interface FriendsTableViewController () <APIControllerProtocol, SearchTextFieldDelegate, UITextFieldDelegate>


@property(strong, nonatomic) NSMutableArray *friends;

@end

@implementation FriendsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"GitHub Friends";
    
    self.friends = [[NSMutableArray alloc] init];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GenericCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Friend *aFriend = self.friends[indexPath.row];
    
    cell.textLabel.text = aFriend.name;
    cell.detailTextLabel.text = aFriend.login;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DetailViewController *newFriendVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    [[self navigationController] pushViewController:newFriendVC animated:YES];
    
    Friend *selectedFriend = self.friends[indexPath.row];
    newFriendVC.friend = selectedFriend;
    
    
}



- (void)loadFriends
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;

    [apiController searchGithubFor:@"komariherring"];
    
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SearchGitHubSegue"])
    {
        SearchViewController *setDateVC = [segue destinationViewController];
        setDateVC.delegate = self;
    }
    
}

#pragma mark - Date Set delegate

-(void)searchWasTyped:(NSString *)userToLookUp

{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
   [apiController searchGithubFor:userToLookUp];
    [self.tableView reloadData];
    
}



-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse

{
    Friend *aFriend = [Friend friendWithDictionary:gitHubResponse];
    
    [self.friends addObject:aFriend];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

@end
