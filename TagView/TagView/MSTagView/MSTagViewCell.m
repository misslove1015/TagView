//
//  MSTagViewCell.m
//  TagView
//
//  Created by miss on 2017/7/31.
//  Copyright © 2017年 mukr. All rights reserved.
//

#import "MSTagViewCell.h"

@implementation MSTagViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectedBackgroundView = [[UIView alloc]initWithFrame:self.bounds];
    self.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
}

@end
