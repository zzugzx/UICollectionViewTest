//
//  FirstViewController.m
//  UI3
//
//  Created by bytedance on 2021/2/1.
//

#import "FirstViewController.h"
#import "FirstLayout.h"
#import "FirstCollectionViewCell.h"
#import "ThirdLayout.h"
#import <Masonry/Masonry.h>

@interface FirstViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) FirstLayout* layout;
@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _layout = [[FirstLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[FirstCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([FirstCollectionViewCell class])];
    }
    return _collectionView;
}
- (void)initView {
    self.navigationItem.hidesBackButton = YES;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FirstCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
