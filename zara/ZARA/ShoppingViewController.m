//
//  ShoppingViewController.m
//  ZARA
//
//  Created by xiaoli pop on 2025/6/5.
//

#import "ShoppingViewController.h"

@interface ShoppingViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UISegmentedControl* segmentControl;
@property (nonatomic, strong)UIScrollView* scrollView;
@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
    [self createSegmentControl];
}

- (void)createSegmentControl {
    self.segmentControl = [[UISegmentedControl alloc] init];
    self.segmentControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.segmentControl];
    [NSLayoutConstraint activateConstraints:@[
            [self.segmentControl.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:50],
            [self.segmentControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant: -50],
            [self.segmentControl.topAnchor constraintEqualToAnchor: self.scrollView.topAnchor constant:-40]
    ]];
    [self.segmentControl insertSegmentWithTitle:@"儿童" atIndex:0 animated:YES];
    [self.segmentControl insertSegmentWithTitle:@"男士" atIndex:1 animated:YES];
    [self.segmentControl insertSegmentWithTitle:@"女士" atIndex:2 animated:YES];
    self.segmentControl.selectedSegmentIndex = 0;
    [self.segmentControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
}

- (void)segChange {
    NSInteger selected = self.segmentControl.selectedSegmentIndex;
    [self.scrollView setContentOffset:CGPointMake(selected * self.scrollView.bounds.size.width, 0) animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat pageWidth = scrollView.frame.size.width;
    self.segmentControl.selectedSegmentIndex = floor((offsetX - pageWidth / 2) / pageWidth) + 1;
}


-  (void)createScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 150, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 320);
    self.scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * 3, [[UIScreen mainScreen] bounds].size.height - 320);\
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    for (int i = 0; i < 3; i++) {
        UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"photo0%d.jpg",i + 7]];
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width * i, 0,[[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 320);
        [self.scrollView addSubview:iView];
    }
    [self.view addSubview:self.scrollView];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
