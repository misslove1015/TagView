//
//  MSTagView.m
//  TagView
//
//  Created by miss on 2017/7/31.
//  Copyright © 2017年 mukr. All rights reserved.
//

#import "MSTagView.h"
#import "MSTagViewCell.h"
#import "MSTagViewLayout.h"

@interface MSTagView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *array;

@end

@implementation MSTagView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addCollectionView];
    }
    return self;
}

- (void)addCollectionView {
    MSTagViewLayout *layout = [[MSTagViewLayout alloc]init];
    layout.itemSpace = 5;
    layout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 5;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MSTagViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
}

- (void)setTagArray:(NSArray *)tagArray {
    self.array = tagArray;
    [self.collectionView reloadData];
}

- (void)selectTagAtIndex:(didSelectTagBlock)block {
    self.didSelectTagBlock = block;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MSTagViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.tagNameLabel.text = self.array[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = [self.array[indexPath.item] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    return CGSizeMake(size.width+24, size.height+16);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.didSelectTagBlock) {
        self.didSelectTagBlock(indexPath.item);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
