//
//  TextViewController.m
//  rssfeedreader
//
//  Created by Aman on 1/21/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "TextViewController.h"
#import "RssTableViewController.h"
#import "RssDetailViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

@synthesize desc;
@synthesize textView;
@synthesize urlt;




- (void)viewDidLoad {
    [super viewDidLoad];
    textView.text= desc;
   // myTextView.text=@"Aman";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        [[segue destinationViewController] setUrl:urlt];
        
        
        
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
