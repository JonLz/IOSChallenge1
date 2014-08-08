//
//  DetailVIewController.m
//  IOS Challenge 1
//
//  Created by Jon on 8/7/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import "DetailVIewController.h"

@interface DetailVIewController ()

@end

@implementation DetailVIewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
    img.backgroundColor = [UIColor orangeColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapImage)];
    [img addGestureRecognizer:tap];
    img.userInteractionEnabled = YES;
    [self.view addSubview:img];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(5, 75, 50, 50);
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)didTapImage
{
    NSLog(@"Tapped image");
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Oh no!" message:@"Hello World" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [av show];
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
