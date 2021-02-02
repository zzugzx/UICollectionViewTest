//
//  SecondLayout.m
//  UI3
//
//  Created by bytedance on 2021/2/2.
//

#import "SecondLayout.h"

@interface SecondLayout ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation SecondLayout


- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    [self createAttrs];
}

- (void)createAttrs {
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.array addObject:attrs];
    }
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat angle = 2 * M_PI * indexPath.item / count;
    CGFloat radius = 100;
    CGFloat Ox = self.collectionView.frame.size.width / 2;
    CGFloat Oy = self.collectionView.frame.size.height / 2;
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.center = CGPointMake(Ox + radius * sin(angle), Oy + radius * cos(angle));
    if (count == 1) {
        attrs.size = CGSizeMake(200, 200);
    } else {
        attrs.size = CGSizeMake(75, 75);
    }
    return attrs;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
@end
