//
//  TwoViewController.m
//  LearningMasonry
//
//  Created by chang on 2018/4/22.
//  Copyright © 2018年 cc. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    self.navigationItem.title = @"two";

    
    for (int i=0; i<6; i++) {
        UIView *greenView = [[UIView alloc] init];
        greenView.tag = 100+i;
        greenView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:greenView];
        
        [greenView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(90);
            make.left.equalTo(self.view).offset(15+((Main_width-15*7)/6+15)*i);
            make.width.equalTo((Main_width-15*7)/6);
            make.bottom.equalTo(self.view).offset(-100);
        }];
    }
    
    
    //click change redView
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.backgroundColor = [UIColor blueColor];
    clickBtn.selected = NO;
    [clickBtn setTitle:@"click change greenView" forState:UIControlStateNormal];
    [clickBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    
    [clickBtn makeConstraints:^(MASConstraintMaker *make) {
        UIView *greenView = [self.view viewWithTag:105];
        make.top.equalTo(greenView.bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(50);
    }];
}

- (void)clickAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        for (int i=0; i<6; i++) {
            UIView *greenView = [self.view viewWithTag:100+i];
            /**
             updateConstraints 在原有的约束上进行改变，更新一下新的约束。
             remakeConstraints 移除之前所有的约束，从新添加约束。
             */
            //这里用刷新updateConstraints做也可以
            [greenView remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(90+((Main_width-15*7)/6+15)*i);
                make.left.equalTo(15);
                make.size.equalTo(CGSizeMake(Main_width-15*2, (Main_width-15*7)/6));
            }];
        }
    }else{
        for (int i=0; i<6; i++) {
            UIView *greenView = [self.view viewWithTag:100+i];
            [greenView remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(90);
                make.left.equalTo(self.view).offset(15+((Main_width-15*7)/6+15)*i);
                make.width.equalTo((Main_width-15*7)/6);
                make.bottom.equalTo(self.view).offset(-100);
            }];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
