//
//  SearchViewController.m
//  GithubFriends
//
//  Created by Komari Herring on 9/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchGitHubTextField;


@end

@implementation SearchViewController : UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Handlers

- (IBAction)searchTapped:(UIButton *)sender
{
    [self.delegate searchWasTyped:self.searchGitHubTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)dismissTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
