//
//  RestoraDetailViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/11.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "RestoraDetailViewController.h"

#import "Utilities.h"
#import "LeavesView.h"
#import <WebKit/WebKit.h>


@interface RestoraDetailViewController ()

@property (readonly) CGPDFDocumentRef pdf;
@property(nonatomic ,strong) WKWebView  *webView;

@end

@implementation RestoraDetailViewController


/**
 *弊：1.仅能浏览，拿不到任何回调，safari不会鸟任何人。
 
 2.固定竖版拖动，想实现翻页动效果就扒瞎
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self createWebView];
}
-(void)createWebView
{
    self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
    NSString *documentLocation;
//    if (self.index == 0) {
//        documentLocation=[[NSBundle mainBundle]pathForResource:@"weblogic安装和部署" ofType:@"docx"];
//    }else
//        if (self.index == 1){
//            documentLocation=[[NSBundle mainBundle]pathForResource:@"iOS" ofType:@"pdf"];
//            
//        }else{
            documentLocation=[[NSBundle mainBundle]pathForResource:@"孟加拉示范社区所在城市情况介绍" ofType:@"pdf"];
//        }
    NSURL *myDocument=[NSURL fileURLWithPath:documentLocation];
    NSURLRequest *request=[NSURLRequest requestWithURL:myDocument];
    
    [self.webView loadRequest:request];
    
    [self.view addSubview:self.webView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.webView reload];
}


/**
 *左右滚动显示
 */

//- (id)init {
//    if (self = [super init]) {
//            CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("iOS.pdf"), NULL, NULL);

//_pdf = CGPDFDocumentCreateWithURL(pdfURL);
//CFRelease(pdfURL);
//
//self.leavesView.backgroundRendering = YES;
//[self displayPageNumber:1];
//    }
//    return self;
//}

- (void)dealloc {
    CGPDFDocumentRelease(_pdf);
    [super dealloc];
}

- (void)displayPageNumber:(NSUInteger)pageNumber {
    self.title = [NSString stringWithFormat:
                                 @"Page %lu of %lu",
                                 pageNumber,
                                 CGPDFDocumentGetNumberOfPages(_pdf)];
}

#pragma mark LeavesViewDelegate

- (void)leavesView:(LeavesView *)leavesView willTurnToPageAtIndex:(NSUInteger)pageIndex {
    [self displayPageNumber:pageIndex + 1];
}

#pragma mark LeavesViewDataSource

- (NSUInteger)numberOfPagesInLeavesView:(LeavesView*)leavesView {
    return CGPDFDocumentGetNumberOfPages(_pdf);
}

- (void)renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
    CGPDFPageRef page = CGPDFDocumentGetPage(_pdf, index + 1);
    CGAffineTransform transform = aspectFit(CGPDFPageGetBoxRect(page, kCGPDFMediaBox),
                                            CGContextGetClipBoundingBox(ctx));
    CGContextConcatCTM(ctx, transform);
    CGContextDrawPDFPage(ctx, page);
}

@end
