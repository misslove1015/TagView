//
//  MSTagViewLayout.m
//  TagView
//
//  Created by miss on 2017/7/31.
//  Copyright © 2017年 mukr. All rights reserved.
//

#import "MSTagViewLayout.h"

@implementation MSTagViewLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 获取系统帮我们计算好的Attributes
    NSArray *answer = [super layoutAttributesForElementsInRect:rect];
    
    // 遍历结果
    for(int i = 1; i < [answer count]; ++i) {
        
        // 获取cell的Attribute，根据上一个cell获取最大的x，定义为origin
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = answer[i - 1];
        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        
        // 若当前cell和precell在同一行：①判断当前的cell加间距后的最大宽度是否小于ContentSize的宽度，
        //                           ②判断当前cell的x是否大于precell的x（否则cell会出现重叠）
        //满足则给当前cell的frame属性赋值（不满足的cell会根据系统布局换行）
        BOOL bool1 = origin + self.itemSpace + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width;
        BOOL bool2 = currentLayoutAttributes.frame.origin.x > prevLayoutAttributes.frame.origin.x;
        
        if(bool1 && bool2) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = origin + self.itemSpace;
            currentLayoutAttributes.frame = frame;
        }
    }
    return answer;
}

@end
