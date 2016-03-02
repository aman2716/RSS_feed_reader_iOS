//
//  TableViewCell.h
//  rssfeedreader
//
//  Created by Aman on 1/24/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, copy) void (^completionHandler)(void);

@property (weak, nonatomic) IBOutlet UILabel *ltitle;
@property (weak, nonatomic) IBOutlet UILabel *llink;
@property (weak, nonatomic) IBOutlet UIImageView *limage;
@property (weak, nonatomic) IBOutlet UILabel *lpubdate;


@end
