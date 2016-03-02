//
//  RssTableViewController.h
//  rssfeedreader
//
//  Created by Aman on 1/19/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppRecord;
@interface RssTableViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableview;
//@property (nonatomic, strong) NSMutableArray *feeds;
//@property (nonatomic, strong) AppRecord *record;
//@property (nonatomic, strong) NSMutableArray *arrImgUrl;

@end
