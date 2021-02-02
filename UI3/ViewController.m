//
//  ViewController.m
//  UI3
//
//  Created by bytedance on 2021/2/1.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import <Masonry/Masonry.h>


@interface ViewController ()

@property (nonatomic, strong) UIButton *lineButton;
@property (nonatomic, strong) UIButton *circleButton;
@property (nonatomic, strong) UIButton *waterflowButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (UIButton *)lineButton {
    if (!_lineButton) {
        _lineButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_lineButton setBackgroundColor:[UIColor redColor]];
        [_lineButton addTarget:self action:@selector(lineLayout:) forControlEvents:UIControlEventTouchUpInside];
        [_lineButton setTitle:@"线性布局" forState:UIControlStateNormal];
    }
    return _lineButton;
}

- (UIButton *)circleButton {
    if (!_circleButton) {
        _circleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_circleButton setBackgroundColor:[UIColor greenColor]];
        [_circleButton setTitle:@"环形布局" forState:UIControlStateNormal];
        [_circleButton addTarget:self action:@selector(circleLayout:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _circleButton;
}

- (UIButton *)waterflowButton {
    if (!_waterflowButton) {
        _waterflowButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_waterflowButton setBackgroundColor:[UIColor blueColor]];
        [_waterflowButton setTitle:@"瀑布流布局" forState:UIControlStateNormal];
        [_waterflowButton addTarget:self action:@selector(waterflowLayout:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _waterflowButton;
}

- (IBAction)lineLayout:(id)sender {
    FirstViewController *nextview = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:nextview animated:YES];
}

- (IBAction)circleLayout:(id)sender {
    SecondViewController *nextview = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:nextview animated:YES];
}

- (IBAction)waterflowLayout:(id)sender {
    ThirdViewController *nextview = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:nextview animated:YES];
}

- (void)initView {
    [self.view addSubview:self.lineButton];
    [self.view addSubview:self.circleButton];
    [self.view addSubview:self.waterflowButton];
    
    [self.lineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(200);
        make.left.mas_equalTo(self.view).offset(100);
        make.right.mas_equalTo(self.view).offset(-100);
        make.height.mas_equalTo(50);
    }];
    [self.circleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.lineButton);
        make.top.mas_equalTo(self.lineButton.mas_bottom).offset(100);
        make.height.mas_equalTo(50);
    }];
    [self.waterflowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.circleButton);
        make.top.mas_equalTo(self.circleButton.mas_bottom).offset(100);
        make.height.mas_equalTo(50);
    }];
    
}
@end
