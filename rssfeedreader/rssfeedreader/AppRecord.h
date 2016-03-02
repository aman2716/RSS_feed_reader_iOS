//
//  AppRecord.h
//  rssfeedreader
//
//  Created by Aman on 1/28/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewCell.h"
@interface AppRecord : NSObject

    
@property (nonatomic, strong) NSString *imgUrl;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) UIImage *appIcon;
@property (nonatomic, strong) NSString *pubDate;

@end
