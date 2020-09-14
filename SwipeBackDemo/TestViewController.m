//
//  TestViewController.m
//  SwipeBackDemo
//
//  Created by HN on 2020/8/21.
//  Copyright © 2020 HN. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UIGestureRecognizerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (nonatomic, assign) CGFloat startX;
@property (assign, nonatomic) BOOL bPanning;
@end

@implementation TestViewController

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    [self.tf addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.view.tag = 101;
}

#pragma mark - UI
- (void)setNav {
    self.title = @"第二个界面";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"点击返回"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(onActionBack:)];
    self.navigationItem.leftBarButtonItem = backButton;
}

#pragma mark - other
- (void)onActionBack:(id)sender
{
    if (self.tf.text.length) {
        [self presentAlert];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//警告框代码
-(void)presentAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警  告" message:@"这里写警告的内容！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *centain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:centain];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"gesture: %@",gestureRecognizer);
    if (gestureRecognizer == self.navigationController.interactivePopGestureRecognizer) {
        if (gestureRecognizer.view.tag == 101) {
            return YES;
        } else {
            if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
                [self onActionBack:nil];
            }
            return NO;
        }
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidChange:(UITextField *)textField {
    if (self.tf.text.length) {
        self.navigationController.interactivePopGestureRecognizer.view.tag = 100;
    } else {
        self.navigationController.interactivePopGestureRecognizer.view.tag = 101;
    }
}
@end
