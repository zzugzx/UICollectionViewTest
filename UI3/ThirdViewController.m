//
//  ThirdViewController.m
//  UI3
//
//  Created by bytedance on 2021/2/2.
//

#import "ThirdViewController.h"
#import "ThirdCollectionViewCell.h"
#import "ThirdLayout.h"

@interface ThirdViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, WaterflowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ThirdLayout *layout;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _layout = [[ThirdLayout alloc] init];
        _layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ThirdCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ThirdCollectionViewCell class])];
    }
    return _collectionView;
}

- (void)initView {
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ThirdCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ThirdCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

#pragma mark - WaterflowLayoutDelegate
- (CGFloat)waterflowLayout:(ThirdLayout *)layout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth {
    return index % 3 * 100;
}
@end
