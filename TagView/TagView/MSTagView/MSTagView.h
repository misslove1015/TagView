//
//  MSTagView.h
//  TagView
//
//  Created by miss on 2017/7/31.
//  Copyright © 2017年 mukr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^didSelectTagBlock)(NSInteger index);

@interface MSTagView : UIView

@property (nonatomic, copy) didSelectTagBlock didSelectTagBlock;
@property (nonatomic, strong) NSArray *tagArray;;

- (void)selectTagAtIndex:(didSelectTagBlock)block;

@end
