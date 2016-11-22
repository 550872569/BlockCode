//
//  BlockViewController.h
//  BlockCode
//
//  Created by Yan on 16/11/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)(NSString *text);



@interface BlockViewController : UIViewController

@property (nonatomic, copy) Block blockText;

@end

