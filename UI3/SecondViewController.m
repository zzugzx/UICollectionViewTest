//
//  SecondViewController.m
//  UI3
//
//  Created by bytedance on 2021/2/1.
//

#import "SecondViewController.h"
#import "SecondLayout.h"
#import "SecondCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface SecondViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) SecondLayout* layout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL onClick;

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _layout = [[SecondLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SecondCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SecondCollectionViewCell class])];
    }
    return _collectionView;
}

- (void)initView {
    [self.view addSubview:self.collectionView];
    [self.collectionView layoutIfNeeded];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SecondCollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SecondCollectionViewCell class]) forIndexPath:indexPath];
    [cell updateColorWithItem:indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.onClick) return;
    self.onClick = YES;
    SecondCollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:1.5f animations:^{
        cell.transform = CGAffineTransformScale(cell.transform, 2, 2);
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:1.5f delay:2.0f options:UIViewAnimationOptionCurveLinear animations:^{
                    cell.transform = CGAffineTransformScale(cell.transform, 1.0 / 2, 1.0 / 2);
                } completion:^(BOOL finished) {
                    self.onClick = NO;
                }];
            }
    }];
}
@end
