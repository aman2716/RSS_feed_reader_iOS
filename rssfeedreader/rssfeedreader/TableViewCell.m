//
//  TableViewCell.m
//  rssfeedreader
//
//  Created by Aman on 1/24/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "TableViewCell.h"
#import "IconDownloader.h"

@implementation TableViewCell
@synthesize ltitle=_ltitle;
@synthesize llink=_llink;
@synthesize lpubdate=_lpubdate;
@synthesize limage=_limage;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
