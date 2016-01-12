//
//  ViewController.m
//  SafariTNG
//
//  Created by Richard Martin on 2016-01-12.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self.spinner startAnimating];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.spinner stopAnimating];
    
}

@end
