#import "RssTableViewController.h"

#define kAppIconSize 48
#import "MBProgressHUD.h"
#import "TextViewController.h"
#import "TableViewCell.h"

#import "AppRecord.h"
#import "IconDownloader.h"
@interface RssTableViewController ()
<UIScrollViewDelegate>
{
    NSXMLParser *parser;
    
}


@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;
@property (nonatomic, strong) NSURLSessionDataTask *sessionTask;
@property (nonatomic, strong) AppRecord *record;
@property (nonatomic, strong) NSMutableArray *feeds;
@property (nonatomic, strong) NSArray *element;
@property (nonatomic, strong) NSMutableArray *arrImgUrl;
@property (nonatomic, strong) NSMutableString *workingPropertyString;

@property (nonatomic, readwrite) BOOL storingCharacterData;

@end

@implementation RssTableViewController{
    
}

@synthesize tableview;
@synthesize arrImgUrl=_arrImgUrl;
@synthesize element=_element;
@synthesize storingCharacterData=_storingCharacterData;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    _element = @[@"title", @"link", @"pubDate", @"description"];
    
    _arrImgUrl=[[NSMutableArray alloc] initWithObjects:
                @"http://is2.mzstatic.com/image/thumb/Purple69/v4/a1/c5/fb/a1c5fb6e-f8b4-80c5-d575-c92084f093fe/mzl.pfnjllbn.png/53x53bb-85.png",
                @"http://is3.mzstatic.com/image/thumb/Purple2/v4/8a/73/6f/8a736f1a-868e-d6b5-635d-f1cc139c2ead/mzl.kyltgxdf.png/53x53bb-85.png",
                @"http://is1.mzstatic.com/image/thumb/Purple6/v4/f0/16/a0/f016a00d-0174-ae7c-5474-b64856c09148/mzl.tccojkqs.jpg/53x53bb-85.png",
                @"http://is5.mzstatic.com/image/thumb/Purple5/v4/41/d5/4c/41d54cb9-657e-0246-e5a1-6198013612d3/mzl.vloabvat.jpg/75x75bb-85.png",
                @"http://is1.mzstatic.com/image/thumb/Purple4/v4/4a/10/fb/4a10fbb6-d7b0-6270-b3fd-4dc59c8b4f09/pr_source.png/53x53bb-85.png",
                @"http://is5.mzstatic.com/image/thumb/Purple69/v4/b7/8f/c2/b78fc21b-188f-34cb-f49c-9f686dca8e03/pr_source.png/53x53bb-85.png",
                @"http://is1.mzstatic.com/image/thumb/Purple49/v4/c1/d2/ed/c1d2ed49-3c2e-cbf7-265f-c51550e631f1/pr_source.png/53x53bb-85.png",
                @"http://is4.mzstatic.com/image/thumb/Purple69/v4/9d/f3/3a/9df33a07-1d0e-8d62-ce9a-f476f4bf0963/mzl.gtlbjsup.png/53x53bb-85.png",
                @"http://is2.mzstatic.com/image/thumb/Purple69/v4/67/f1/c2/67f1c245-04b9-fa29-4113-a428a124206e/mzl.mvkbnvcr.png/53x53bb-85.png",
                @"http://is4.mzstatic.com/image/thumb/Purple4/v4/f5/68/69/f56869ca-ecc7-b078-2ad9-9dd759a675b7/mzl.kanjtbmh.png/53x53bb-85.png",
                @"http://is4.mzstatic.com/image/thumb/Purple3/v4/51/a3/46/51a3466b-fdec-a5ed-5e29-c814b07ad77f/pr_source.png/53x53bb-85.png",
                @"http://is5.mzstatic.com/image/thumb/Purple6/v4/3a/c2/bb/3ac2bb80-5efb-93b3-8880-0f5771e65b92/mzl.krvrtnps.png/53x53bb-85.png",
                @"http://is5.mzstatic.com/image/thumb/Purple69/v4/6b/92/4d/6b924d8d-64fd-2538-bd67-5cb5cfd33c61/mzl.ogkowshr.png/53x53bb-85.png",
                @"http://is2.mzstatic.com/image/thumb/Purple69/v4/b1/e2/8d/b1e28d0d-810b-173a-2d97-6a472774c6ae/mzl.uulfrkla.png/53x53bb-85.png",
                @"http://is1.mzstatic.com/image/thumb/Purple49/v4/10/86/6a/10866a26-f2e7-459e-8cfe-b49a4f8dacdf/mzl.gkgcjotz.png/53x53bb-85.png",
                @"http://is4.mzstatic.com/image/thumb/Purple5/v4/df/fb/18/dffb188c-e3c6-61a4-dceb-7ee424f746ec/mzl.nwdenbch.jpg/53x53bb-85.png",
                @"http://is2.mzstatic.com/image/thumb/Purple49/v4/5a/ba/f0/5abaf087-2980-a818-4fe0-eda8290d268f/pr_source.jpg/53x53bb-85.png",
                @"http://is3.mzstatic.com/image/thumb/Purple69/v4/52/56/06/5256062d-e4a1-5462-eee1-25ec07c33c41/pr_source.jpg/53x53bb-85.png",
                @"http://is5.mzstatic.com/image/thumb/Purple69/v4/ab/d2/2a/abd22ad5-05cf-82a9-6f2e-7cd59d0f271b/mzl.kpexjjvb.png/53x53bb-85.png",
                @"http://is4.mzstatic.com/image/thumb/Purple69/v4/0f/02/3e/0f023e87-00cb-09d1-7796-43e8d90e75cb/mzl.oaabscls.png/53x53bb-85.png", nil];


    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2.00 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.feeds = [[NSMutableArray alloc] init];
        NSURL *url = [NSURL URLWithString:@"http://images.apple.com/main/rss/hotnews/hotnews.rss"];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
    });
    
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)terminateAllDownloads
{
    // terminate all pending download connections
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
    
    [self.imageDownloadsInProgress removeAllObjects];
}

// -------------------------------------------------------------------------------
//	dealloc
//  If this view controller is going away, we need to cancel all outstanding downloads.
// -------------------------------------------------------------------------------
- (void)dealloc
{
    // terminate all pending download connections
    [self terminateAllDownloads];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    
    AppRecord *appRecord = _feeds[indexPath.row];
    
   // NSLog(@"title == %@",appRecord);
    cell.ltitle.text = appRecord.title;
    
    cell.llink.text = appRecord.link;
    cell.lpubdate.text = appRecord.pubDate;
    //NSLog(@"%@",self.arrImgUrl);
    appRecord.imgUrl=[self.arrImgUrl objectAtIndex:indexPath.row];
//    NSLog(@"%@",iurl);
//        appRecord.imgUrl=iurl;
    //NSLog(@"%@",appRecord.imgUrl);
////    ////    //cell.limage.image = self.appRecord.appIcon;
////    ////
////    ////    //[self startIconDownload:self.appRecord forIndexPath:indexPath];
        if (!appRecord.appIcon)
        {
            if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
            {
                
                [self startIconDownload:appRecord forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.limage.image = [UIImage imageNamed:@"Placeholder.png"];
        }
        else
        {
            cell.limage.image = appRecord.appIcon;
        }

    
    
    return cell;
}

- (void)startIconDownload:(AppRecord *)appRecord forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = (self.imageDownloadsInProgress)[indexPath];
    if (iconDownloader == nil)
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.appRecord = appRecord;
        [iconDownloader setCompletionHandler:^{
            
            TableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            
            // Display the newly loaded image
            cell.limage.image = appRecord.appIcon;
            
            // Remove the IconDownloader from the in progress list.
            // This will result in it being deallocated.
            [self.imageDownloadsInProgress removeObjectForKey:indexPath];
            
        }];
        (self.imageDownloadsInProgress)[indexPath] = iconDownloader;
        [iconDownloader startDownload];
    }
}


- (void)loadImagesForOnscreenRows
{
    //if (feeds.count > 0)
    {
        NSArray *visiblePaths = [self.tableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            AppRecord *appRecord = self.feeds[indexPath.row];
            
            if (!appRecord.appIcon)
                // Avoid the app icon download if the app already has an icon
            {
                [self startIconDownload:appRecord forIndexPath:indexPath];
            }
        }
    }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        [self loadImagesForOnscreenRows];
    }
}

// -------------------------------------------------------------------------------
//	scrollViewDidEndDecelerating:scrollView
//  When scrolling stops, proceed to load the app icons that are on screen.
// -------------------------------------------------------------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    
    
  
    NSLog(@"%@",self.element);
        self.workingPropertyString = [[NSMutableString alloc] init];
        if ([elementName isEqualToString:@"item"]) {
            self.record = [[AppRecord alloc] init];
            
        }
   
    
self.storingCharacterData = [self.element containsObject:elementName];
    
    //NSLog(@"%d",self.storingCharacterData);
    
       
    
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    //NSLog(@"%d %@",self.storingCharacterData, elementName);
    if (self.record != nil)
    {
        if (self.storingCharacterData)
        {
           // NSLog(@"***%@",self.workingPropertyString);
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
             // NSLog(@"%@",trimmedString);
            [self.workingPropertyString setString:@""];
        
          
            
            if ([elementName isEqualToString:@"title"]) {
                self.record.title = trimmedString;
               // NSLog(@"%@",self.record.title);
            }
            else if ([elementName isEqualToString:@"link"]) {
                self.record.link = trimmedString;
            }
            else if([elementName isEqualToString:@"description"]) {
                self.record.description = trimmedString;
            }
            else if([elementName isEqualToString:@"pubDate"]) {
                self.record.pubDate = trimmedString;
            }
        
        
       else if ([elementName isEqualToString:@"item"])
        {
            //NSLog(@"sfjwhfs");
            [self.feeds addObject:self.record];
            //NSLog(@"%@",self.feeds);
            self.record = nil;
        }
    
        }
    }
    

}

    - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
    {
        if (self.storingCharacterData)
        {
        
            [self.workingPropertyString appendString:string];
            // NSLog(@" %d ###%@ *****%@",self.storingCharacterData, self.workingPropertyString,string);
        }
    }
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showText"]) {
        NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
        TextViewController *tv = segue.destinationViewController;
        AppRecord *appRecord=_feeds[indexPath.row];
       NSString *stringd = appRecord.description;
        tv.desc=stringd;
        
        NSString *stringl = appRecord.link;
        tv.urlt=stringl;
        
        
        
    }
}

@end
