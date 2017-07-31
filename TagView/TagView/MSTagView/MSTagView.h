//
//  MSTagView.h
//  TagView
//
//  Created by miss on 2017/7/31.
//  Copyright © 2017年 mukr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^getHeightBlock)(CGFloat height);

@interface MSTagView : UIView

@property (nonatomic, copy) getHeightBlock getHeightBlock;

// 设置标签数组并返回整个标签View的高度
- (void)setTagArray:(NSArray *)array tagViewHeight:(getHeightBlock)block;

@end
