//
//  DetailViewController.m
//  GithubFriends
//
//  Created by Komari Herring on 9/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

//properties and connections

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *friendImageView;

- (void)configureView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail view

- (void)setFriend:(Friend *)newFriend
{
    if (_friend != newFriend)
    {
        _friend = newFriend;
        
        // Update the view.
        [self configureView];
    }
}



#pragma mark - Configure the view

- (void)configureView
{
    if (self.friend)
    {
        self.title = [NSString stringWithFormat: @"GitHub Friend"];
        
        self.nameLabel.text = self.friend.name;
        
        self.loginLabel.text = self.friend.login;
        
        self.locationLabel.text = self.friend.location;
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.friend.avatar_url]];

        
        self.friendImageView.image = [UIImage imageWithData: imageData];
        
        
        
    }
    
}

@end
