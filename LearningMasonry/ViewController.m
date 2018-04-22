//
//  ViewController.m
//  LearningMasonry
//
//  Created by chang on 2018/4/21.
//  Copyright © 2018年 cc. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"随便点击一下跳转";
    
    
    //red
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Main_Navbottom+20);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(Main_width/2);
        make.bottom.equalTo(self.view).offset(-50);
    }];
    
    
    //green
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Main_Navbottom+40);
        make.left.equalTo(redView.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(80);
    }];
    
    //blue
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(10);
        make.centerX.equalTo(greenView);
        make.width.equalTo(greenView);
        make.bottom.equalTo(self.view).offset(-50);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    OneViewController *oneVC = [[OneViewController alloc] init];
    [self.navigationController pushViewController:oneVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
