//
//  FirstCollectionViewCell.m
//  UI3
//
//  Created by bytedance on 2021/2/1.
//

#import "FirstCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface FirstCollectionViewCell ()
    
@property (nonatomic, strong) UIView * view;

@end

@implementation FirstCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initView];
    }
    return self;
}

- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor yellowColor];
    }
    return _view;
}

- (void)initView {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.view];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}
@end
