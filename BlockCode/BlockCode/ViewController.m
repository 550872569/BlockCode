//
//  ViewController.m
//  BlockCode
//
//  Created by Yan on 16/11/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ViewController.h"
#import "BlockViewController.h"

typedef void(^MyBlock)(NSInteger i);

@interface ViewController ()

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) MyBlock block;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self blcokReturn];
    NSLog(@"[self blcokReturn]%@",[self blcokReturn]);
}

- (void(^)())blcokReturn {
    void(^Block)(int) = ^(int x) {
        NSLog(@"x--%d",x);
    };
    
    return Block;
}

- (void)blockParameter {
    void(^blockStrack)() = ^{
        NSLog(@"123");
    };
    [self block:blockStrack];
}

- (void)blockDefinition {
    
    void(^block)(int) = ^(int x) {
//      NSLog(@"x%d",x);
        NSLog(@"123");
    };

    void(^blockStrack)() = ^{
        NSLog(@"123");
    };
    
    block(1);
    
    blockStrack();
    
    NSLog(@"block%@",block);

    NSLog(@"blockStrack%@",blockStrack);
}

- (void)block:(void(^)())block {
    NSLog(@"block %@",block);
}

void blockFunc () {
    NSLog(@"C Func");
}

- (void)blockCode {
    __block int age = 10;
    
    NSLog(@"age000 %d %p ",age,&age);
    self.block = ^ (NSInteger i) {
        //        age = 20;
        NSLog(@"age111 %d %p ",age,&age);
        
    };
    age = 10;
    NSLog(@"age222 %d %p ",age,&age);
    self.block(age);
}

- (void)blockDemo {
    BlockViewController *vcBlock = [BlockViewController new];
    __weak ViewController *weakSelf = self;
    vcBlock.blockText = ^(NSString *text) {
        weakSelf.name = text;
        NSLog(@"name%@",weakSelf.name);
    };
    [self.navigationController pushViewController:vcBlock animated:YES];
}

- (void)blockDemoString {
    __block  NSMutableString  *string = [NSMutableString stringWithString:@"123"];
    NSLog(@" 0 %@ %p",string,&string);
    self.block = ^ (NSInteger i) {
        [string setString:@"000"];
        NSLog(@" 1 %@ %p",string,&string);
        string = [NSMutableString stringWithString:@"999"];
        NSLog(@" 2 %@ %p",string,&string);
    };
    [string setString:@"111"];
    NSLog(@" 3 %@ %p",string,&string);
    self.block(1);
    NSLog(@" 4 %@ %p",string,&string);
}

@end
