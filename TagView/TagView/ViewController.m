//
//  ViewController.m
//  TagView
//
//  Created by miss on 2017/7/31.
//  Copyright © 2017年 mukr. All rights reserved.
//

#import "ViewController.h"
#import "MSTagView.h"

@interface ViewController ()

@property (nonatomic, strong) MSTagView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tagView = [[MSTagView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    NSArray *array = @[@"台风",@"杭州",@"气象",@"大气科学",@"中国",@"天气",@"夏天",@"千岛湖",@"今日头条"];
    self.tagView.tagArray = array;
    [self.tagView selectTagAtIndex:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
    [self.view addSubview:self.tagView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
