//
//  IconDownloader.h
//  rssfeedreader
//
//  Created by Aman on 1/28/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "Foundation/Foundation.h"
@class AppRecord;
@interface IconDownloader : NSObject

@property (nonatomic, strong) AppRecord *appRecord;
@property (nonatomic, copy) void (^completionHandler)(void);

- (void)startDownload;
- (void)cancelDownload;
@end
