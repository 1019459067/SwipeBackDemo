//
//  ViewController.m
//  SwipeBackDemo
//
//  Created by HN on 2020/8/20.
//  Copyright © 2020 HN. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第一个界面";
}

- (IBAction)onAction:(UIButton *)sender {    
    TestViewController *test = [[TestViewController alloc]init];
    [self.navigationController pushViewController:test animated:YES];
}
@end
