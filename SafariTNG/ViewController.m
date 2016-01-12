//
//  ViewController.m
//  SafariTNG
//
//  Created by Richard Martin on 2016-01-12.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadGivenURL:@"http://www.google.com"];
    
//    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self loadGivenURL:textField.text];
    
    return true;
}

-(void)loadGivenURL:(NSString *)givenURL {
    
    NSURL *url = [NSURL URLWithString:givenURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self.spinner startAnimating];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.spinner stopAnimating];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"Gnarly, dude. Something is wrong here." message:error.description preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *goHome = [UIAlertAction actionWithTitle:@"Go Home" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self loadGivenURL:@"http://www.google.com"];
    }];
    
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [alertControl addAction:goHome];
    [alertControl addAction:cancelButton];
    [self presentViewController:alertControl animated:true completion:nil];
    
    
}

@end
