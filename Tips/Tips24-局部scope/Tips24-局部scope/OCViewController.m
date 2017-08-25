//
//  OCViewController.m
//  Tips24-局部scope
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 7feel. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    
    {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 200, 40)];
        titleLabel.textColor = [UIColor redColor];
        titleLabel.text = @"Title";
        [view addSubview:titleLabel];
    }
    
    {
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 200, 40)];
        textLabel.textColor = [UIColor redColor];
        textLabel.text = @"Text";
        [view addSubview:textLabel];

    }
    
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 20, 40)];
        label.textColor = [UIColor redColor];
        label.text = @"Title";
        [view addSubview:label];
        label;
        
    });
    
    self.view = view;
}

@end
