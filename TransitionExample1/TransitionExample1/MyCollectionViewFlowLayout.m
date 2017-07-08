//
//  MyCollectionViewFlowLayout.m
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyCollectionViewFlowLayout.h"

@implementation MyCollectionViewFlowLayout

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width * 0.5;
        CGFloat itemHeight = itemWidth;
        self.itemSize = CGSizeMake(itemWidth, itemHeight);
        self.minimumLineSpacing = ceil(itemWidth * 0.3);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGFloat verticalMarge = ([UIScreen mainScreen].bounds.size.height - itemHeight) / 2;
        CGFloat horizontalMarge = ([UIScreen mainScreen].bounds.size.width - itemWidth) / 2;
        self.sectionInset = UIEdgeInsetsMake(verticalMarge, horizontalMarge, verticalMarge, horizontalMarge);
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    [self adjustAttributes:attributes];
    return attributes;
}

- (nullable NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray<UICollectionViewLayoutAttributes *> *attributeArray = [super layoutAttributesForElementsInRect:rect];
    [attributeArray enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull attributes, NSUInteger idx, BOOL * _Nonnull stop) {
        [self adjustAttributes:attributes];
    }];
    
    return attributeArray;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat pageWidth = self.itemSize.width + self.minimumLineSpacing;
    CGFloat contentCenterOffsetX = proposedContentOffset.x + self.collectionView.frame.size.width / 2.0f - self.sectionInset.left + self.minimumLineSpacing / 2.0f;
    CGFloat targetPageIndex = floor(contentCenterOffsetX / pageWidth);
    
    CGFloat pagingRange = 0.3f;
    
    if (contentCenterOffsetX > pageWidth * (targetPageIndex + (1 - pagingRange))) {
        targetPageIndex += 1.0f;
    } else if (contentCenterOffsetX < pageWidth * (targetPageIndex + pagingRange)) {
        targetPageIndex -= 1.0f;
    }
    
    CGFloat targetContentCenterOffsetX = pageWidth * (targetPageIndex + 0.5f);
    CGFloat targetContentOffsetX = targetContentCenterOffsetX - self.collectionView.frame.size.width / 2.0f + self.sectionInset.left - self.minimumLineSpacing / 2.0f;
    CGPoint targetContentOffset = CGPointMake(targetContentOffsetX, proposedContentOffset.y);
    
    return targetContentOffset;
}

#pragma mark - private

- (void)adjustAttributes:(UICollectionViewLayoutAttributes *)attributes {
    CGFloat collectionViewCenterX = self.collectionView.frame.size.width / 2.0f;
    CGFloat itemCenterX = attributes.center.x - self.collectionView.contentOffset.x;
    CGFloat scaleRange = 80.0f;
    CGFloat centerXDelta = fabs(collectionViewCenterX - itemCenterX);
    if (centerXDelta < scaleRange) {
        CGFloat scale = 1.0f + (1.0f - centerXDelta / scaleRange) * 0.3f;
        attributes.size = CGSizeMake(ceil(attributes.size.width * scale), ceil(attributes.size.height * scale));
    }
}

@end
