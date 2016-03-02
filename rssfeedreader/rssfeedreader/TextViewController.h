//
//  TextViewController.h
//  rssfeedreader
//
//  Created by Aman on 1/21/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController
@property (nonatomic,strong) NSString *desc;
@property (nonatomic,strong) NSString *urlt;


@property (nonatomic,strong) IBOutlet UITextView *textView;

@end
