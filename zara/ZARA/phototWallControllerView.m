//
//  phototWallControllerView.m
//  ZARA
//
//  Created by xiaoli pop on 2025/6/6.
//

#import "phototWallControllerView.h"
#import "accountControllerView.h"
@interface phototWallControllerView ()
@property (nonatomic, strong)UIScrollView* scrollView;
@end

@implementation phototWallControllerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    //self.tabBarController.tabBarHidden = YES;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.scrollView = [[UIScrollView alloc] initWithFrame:screenBounds];
    self.scrollView.contentSize = CGSizeMake(screenBounds.size.width, screenBounds.size.height * 1.5);
    for (int i = 0; i < 9; i++) {
        NSString* strName = [NSString stringWithFormat:@"photo0%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake(15 + (i % 3) * 125, 15 + (i / 3) * 165, 120, 130);
        [self.scrollView addSubview:iView];
        iView.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseToChange:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [iView addGestureRecognizer:tap];
    }
    [self.view addSubview: self.scrollView];
}


- (void)chooseToChange:(UITapGestureRecognizer*)tap {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"是否确认更换" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancleAction];
    UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImageView* imageView = (UIImageView*)tap.view;
        [self.delegate change:imageView.image];
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
