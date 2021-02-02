//
//  FirstLayout.m
//  UI3
//
//  Created by bytedance on 2021/2/1.
//

#import "FirstLayout.h"

@implementation FirstLayout

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(150, 150);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    self.minimumLineSpacing = 50.0f;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGRect rect;
    rect.origin = CGPointMake(proposedContentOffset.x, 0);
    rect.size = self.collectionView.frame.size;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = self.collectionView.frame.size.width / 2 + proposedContentOffset.x;
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attributes in array) {
        if (ABS(minDelta) > ABS(attributes.center.x - centerX)) {
            minDelta = attributes.center.x - centerX;
        }
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *newarray = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width / 2;
    for (UICollectionViewLayoutAttributes *attributes in newarray) {
        CGFloat delta = ABS(attributes.center.x - centerX);
        CGFloat scale = 1 - delta / self.collectionView.frame.size.width;
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return newarray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
