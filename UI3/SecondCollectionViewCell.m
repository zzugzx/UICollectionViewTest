//
//  SecondCollectionViewCell.m
//  UI3
//
//  Created by bytedance on 2021/2/2.
//

#import "SecondCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface SecondCollectionViewCell ()

@property (nonatomic, strong) UIView * view;

@end

@implementation SecondCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initView];
    }
    return self;
}

- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] init];
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

- (void)updateColorWithItem:(NSInteger)item {
    if (item % 3 == 0) {
        [self.view setBackgroundColor:[UIColor redColor]];
    } else if (item % 3 == 1) {
        [self.view setBackgroundColor:[UIColor greenColor]];
    } else {
        [self.view setBackgroundColor:[UIColor blueColor]];
    }
    
}
@end
