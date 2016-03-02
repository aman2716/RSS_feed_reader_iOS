//
//  RssDetailViewController.m
//  rssfeedreader
//
//  Created by Aman on 1/20/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "RssDetailViewController.h"

#import "RssTableViewController.h"

@implementation RssDetailViewController

@synthesize url;
#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEncodingWithAllowedCharacters:set]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];
    
    
    /*NSURL *urls = [NSURL URLWithString:url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urls];
    [_webView loadRequest:urlRequest];*/
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
