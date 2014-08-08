//
//  ViewController.m
//  IOS Challenge 1
//
//  Created by Jon on 8/7/14.
//  Copyright (c) 2014 Reddit. All rights reserved.
//

#import "ViewController.h"
#import "DetailVIewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UITextField *unInput,*pwInput;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createFields];
    [self createButtons];
}

- (void)createFields
{
    UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 120, 40)];
    username.text = @"Username: ";
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 120, 40)];
    password.text = @"Password: ";
    
    [self.view addSubview:username];
    [self.view addSubview:password];
    
    unInput = [[UITextField alloc] initWithFrame:CGRectMake(125, 10, 120, 40)];
    unInput.layer.borderWidth = 1.0f;
    unInput.layer.borderColor = [UIColor grayColor].CGColor;
    pwInput = [[UITextField alloc] initWithFrame:CGRectMake(125, 60, 120, 40)];
    pwInput.secureTextEntry = YES;
    pwInput.layer.borderColor = unInput.layer.borderColor;
    pwInput.layer.borderWidth = unInput.layer.borderWidth;
    
    [self.view addSubview:unInput];
    [self.view addSubview:pwInput];
}

- (void)createButtons
{
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitButton.frame = CGRectMake(5, 110, 60, 20);
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
}

- (void)submit
{
        // username is 8 and alphabetic
        // pw is 8
    NSString *unText, *pwText;
    unText = unInput.text;
    pwText = pwInput.text;
    
    if ([unText length] < 8 || [pwText length] < 8) {
        NSLog(@"Returning due to length");
        return;}
    NSCharacterSet *s = [NSCharacterSet letterCharacterSet];
    s = [s invertedSet];
    NSRange r = [unText rangeOfCharacterFromSet:s];
    if (r.location != NSNotFound) {
        NSLog(@"Returning due to alpha numeric");
        return;}
    
    DetailVIewController *dvc = [[DetailVIewController alloc] init];
    [self presentViewController:dvc animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    unInput.text = @"";
    pwInput.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
