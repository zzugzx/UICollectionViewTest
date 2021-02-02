//
//  ThirdLayout.h
//  UI3
//
//  Created by bytedance on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ThirdLayout;

@protocol WaterflowLayoutDelegate <NSObject>

@required
- (CGFloat)waterflowLayout:(ThirdLayout *)layout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;
@optional
- (CGFloat)columnCountInWaterflowLayout:(ThirdLayout *)layout;
- (CGFloat)columnMarginInWaterflowLayout:(ThirdLayout *)layout;
- (CGFloat)rowMarginInWaterflowLayout:(ThirdLayout *)layout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(ThirdLayout *)layout;

@end

@interface ThirdLayout : UICollectionViewLayout

@property (nonatomic, weak) id<WaterflowLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
