//
//  ViewController.m
//  rssfeedreader
//
//  Created by Aman on 1/15/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *notificationlabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.username =@"aman";
    self.password =@"password";
    
}
- (IBAction)loginWasPressed:(id)sender {
    BOOL isUsersEqual =[self.username isEqualToString:[self.usernameTextField text]];
    BOOL isPasswordsEqual = [self.password isEqualToString:[self.passwordTextField text]];
    
    if(isUsersEqual && isPasswordsEqual)
    {
        NSLog(@"SUCCESS!");
        [self.notificationlabel setText:@"Congratulation you have logged in!"];
        UITableViewController *rs = [self.storyboard instantiateViewControllerWithIdentifier:@"idrss"];
        
        [self.navigationController pushViewController:rs animated:YES ];
    }
    else{
        NSLog(@"FAILURE!");
        [self.notificationlabel setText:@"You username or password was incorrect"];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
