#import "VCofChangeUsername.h"
#import "accountControllerView.h"
@interface VCofChangeUsername ()

@end

@implementation VCofChangeUsername

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* label = [[UILabel alloc] init];
        label.text = @"编辑昵称";
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(0, 0, 150, 20);
        label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.origin.y + 30);
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    
    self.nicknameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 40)];
    self.nicknameTextField.placeholder = @"请输入昵称";
    self.nicknameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.nicknameTextField];

    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    saveButton.frame = CGRectMake(20, 160, self.view.bounds.size.width - 40, 40);
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
}

- (void)saveButtonTapped {
    NSString *newNickname = self.nicknameTextField.text;
    //这里触发代理属性
    if (newNickname.length > 0) {
        [self.delegate changeName:newNickname];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入昵称" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
