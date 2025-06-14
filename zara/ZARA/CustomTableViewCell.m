//
//  CustomTableViewCell.m
//  ZARA
//
//  Created by xiaoli pop on 2025/6/7.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        /*
         防止系统自动生成约束
         这句话的作用是阻止视图自动把autoresizing mask 转换为 Auto Layout约束
         Autoresizing Mask：这是一种相对简单的布局机制，通过sutoresizingMask属性，可以让视图依据父视图的尺寸变化自动调整自身的位置和大小
         AutoLayout：这是一种更为灵活且强大的布局系统，它借助定义视图间的约束关系（像对齐、间距、比例等）来确定视图的位置和大小
         当创建一个视图时，如果没有为其制定任何约束，系统会默认生成一组基于autoresizingMask的约束，这样一来，如果要手动添加Auto Layout约束时，就会和系统自动产生的约束产生冲突
         
         */
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.titleLabel];
        
        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.font = [UIFont systemFontOfSize:18];
        self.detailLabel.textAlignment = NSTextAlignmentCenter;
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.detailLabel];
        
        //添加约束
        [NSLayoutConstraint activateConstraints:@[
                    [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
                    [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
                    [self.detailLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
                    [self.detailLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor]
        ]];
    }
    return  self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
