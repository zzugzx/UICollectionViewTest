//
//  SecondCollectionViewCell.h
//  UI3
//
//  Created by bytedance on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondCollectionViewCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame;
- (void)updateColorWithItem:(NSInteger)item;

@end

NS_ASSUME_NONNULL_END
