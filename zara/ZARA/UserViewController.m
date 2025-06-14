#import "UserViewController.h"
#import "accountControllerView.h"
@interface UserViewController ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *wechatLabel;
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, copy)NSString* name;
@property (nonatomic, copy)NSString* account;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"Pop-xiaoli";
    self.account = @"f2397846118";
    self.title = @"个人主页";
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];

    //设置分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //通过一个空白图覆盖掉空的表格
    self.tableView.tableFooterView = [UIView new];

    [self setupHeaderView];
    self.nameLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(press:)];
    tap1.numberOfTouchesRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    [self.nameLabel addGestureRecognizer:tap1];
    self.menuItems = @[
        @{@"title": @"服务", @"icon": @"checkmark.circle"},
        @{@"title": @"收藏", @"icon": @"cube.box"},
        @{@"title": @"朋友圈", @"icon": @"photo.on.rectangle"},
        @{@"title": @"卡包", @"icon": @"creditcard"},
        @{@"title": @"设置", @"icon": @"gear"}
    ];
}

- (void)changeHeaderphoto:(UIImage *)image {
    self.avatarImageView.image = image;
}

-(void)changeHeaderName:(NSString *)name {
    self.nameLabel.text = [name copy];
}

- (void)press:(UIGestureRecognizer* )tap {
    
    accountControllerView* vc = [[accountControllerView alloc] init];
    vc.image = self.avatarImageView.image;
    vc.delegate = self;
    vc.userAccount = [self.account copy];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupHeaderView {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    self.avatarImageView.layer.cornerRadius = 30;
    self.avatarImageView.clipsToBounds = YES;
    self.avatarImageView.image = [UIImage imageNamed:@"p1.jpg"];
    [header addSubview:self.avatarImageView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, 200, 25)];
    self.nameLabel.text = self.name;
    self.nameLabel.font = [UIFont boldSystemFontOfSize:20];
    [header addSubview:self.nameLabel];
    
    self.wechatLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 200, 20)];
    self.wechatLabel.text = self.account;
    self.wechatLabel.font = [UIFont systemFontOfSize:14];
    self.wechatLabel.textColor = [UIColor grayColor];
    [header addSubview:self.wechatLabel];
    
    self.tableView.tableHeaderView = header;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSDictionary *item = self.menuItems[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:25];
    cell.imageView.image = [UIImage systemImageNamed:item[@"icon"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.tag = indexPath.row + 101;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}




@end
