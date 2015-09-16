//
//  ViewController.m
//  SafariNTG
//
//  Created by Edil Ashimov on 7/15/15.
//  Copyright (c) 2015 Edil Ashimov. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadUrl:@"http://mobilemakers.co"];
}

- (void)loadUrl:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void) webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self loadUrl:textField.text];

    [textField resignFirstResponder];
    return YES;
}

- (void) webView:(UIWebView *) webView didFailLoadWithError:(NSError *) error  {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"loadingFailed";
    alert.message = error.localizedDescription;
    alert.delegate = self;
    [alert addButtonWithTitle:@"tryAgain"];
    [alert addButtonWithTitle:@"goHome"];
    [alert show];
    [self.spinner stopAnimating];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self loadUrl:@"http://vokal.io"];
  }

}
@end
