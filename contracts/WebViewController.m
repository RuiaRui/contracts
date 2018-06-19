//
//  WebViewController.m
//  contracts
//
//  Created bt Alex on 2018/6/18.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bouds = [UIScreen mainScreen].bounds;
    UIWebView* webView = [[UIWebView alloc]initWithFrame:bouds];
    
    //    2、加载在线资源http内容
    
    NSURL* url = [NSURL URLWithString:@"https://www.baidu.com"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建
    [webView loadRequest:request];//加载
    
    [self.view addSubview:webView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
