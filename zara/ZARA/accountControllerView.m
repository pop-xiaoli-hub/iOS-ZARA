
//
//  accountControllerView.m
//  ZARA
//
//  Created by xiaoli pop on 2025/6/6.
//

#import "accountControllerView.h"
#import "phototWallControllerView.h"
#import "VCofChangeUsername.h"
#import "CustomTableViewCell.h"
@interface accountControllerView ()
@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)NSArray* array;
@end

@implementation accountControllerView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息编辑";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:self.image];
    imageView.frame = CGRectMake(0, 0, 180, 180);
    imageView.center = CGPointMake(self.view.bounds.size.width / 2, 200);
    imageView.layer.cornerRadius = 90;
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    self.array = @[@"头像", @"昵称", @"账号", @"修改密码"];
    CGRect tableViewFrame = self.view.bounds;
    tableViewFrame.origin.y = 330;
    tableViewFrame.size.height -= 250;
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomCell"];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
}

- (void)change:(UIImage*)image {
    [self.delegate changeHeaderphoto:image];
}

- (void)changeName:(NSString *)name {
    [self.delegate changeHeaderName:name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell* cell = (CustomTableViewCell* )[tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.titleLabel.text = [self.array objectAtIndex:indexPath.row];
    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = [self.array objectAtIndex:indexPath.row];
        cell.detailLabel.text = self.stringOfname;
    }
    if (indexPath.row == 2) {
        cell.titleLabel.text = [self.array objectAtIndex:indexPath.row];
    }
    if (indexPath.row == 3) {
        cell.titleLabel.text = [self.array objectAtIndex:indexPath.row];
    }

    return  cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        phototWallControllerView* vc = [[phototWallControllerView alloc] init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        VCofChangeUsername* vc = [[VCofChangeUsername alloc] init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
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
