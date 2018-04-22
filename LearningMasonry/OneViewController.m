//
//  OneViewController.m
//  LearningMasonry
//
//  Created by chang on 2018/4/22.
//  Copyright © 2018年 cc. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"One";
    
    //red
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(Main_Navbottom+10);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.height.equalTo(100);
    }];
    
    
    for (int i = 0; i<5; i++) {
        //green
        UIView *greenView = [[UIView alloc] init];
        greenView.tag = i+100;
        greenView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:greenView];
        
        [greenView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(redView.bottom).offset(10);
            make.left.equalTo(15+((Main_width-15*6)/5+15)*i);
            make.size.equalTo(CGSizeMake((Main_width-15*6)/5, 60));
        }];
    }
    
    //click change greenView
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.backgroundColor = [UIColor blueColor];
    clickBtn.selected = NO;
    [clickBtn setTitle:@"click change greenView" forState:UIControlStateNormal];
    [clickBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    
    [clickBtn makeConstraints:^(MASConstraintMaker *make) {
        UIView *greenView = [self.view viewWithTag:100];
        make.top.equalTo(greenView.bottom).offset(20);
        make.width.equalTo(self.view);
        make.height.equalTo(50);
    }];
 
    //yellow
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    [yellowView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clickBtn.bottom).offset(10);
        make.left.equalTo(redView.left);
        make.size.equalTo(CGSizeMake(100, 120));
    }];
    
    //click push
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.backgroundColor = [UIColor blueColor];
    [pushBtn setTitle:@"click push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(clickPushBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
    [pushBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clickBtn.bottom).offset(10);
        make.left.equalTo(yellowView.right).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.right.equalTo(self.view).offset(-10);
    }];
}

- (void)clickAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        for (int i=0; i<5; i++) {
            UIView *greenView = [self.view viewWithTag:100+i];
            [greenView updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(120);
            }];
        }
    }else{
        for (int i=0; i<5; i++) {
            UIView *greenView = [self.view viewWithTag:100+i];
            [greenView updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(60);
            }];
        }
    }
}

- (void)clickPushBtn:(UIButton *)sender
{
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
