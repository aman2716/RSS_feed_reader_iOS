//
//  RssDetailViewController.h
//  rssfeedreader
//
//  Created by Aman on 1/20/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RssDetailViewController : UIViewController

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
