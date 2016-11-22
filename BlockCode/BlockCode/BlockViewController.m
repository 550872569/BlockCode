//
//  BlockViewController.m
//  BlockCode
//
//  Created by Yan on 16/11/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"self%@",self);
    if (self.blockText) {
        self.blockText(@"123");
    }
}

@end
