//
//  accountControllerView.h
//  ZARA
//
//  Created by xiaoli pop on 2025/6/6.
//

#import <UIKit/UIKit.h>
#import "VCofChangeUsername.h"
#import "CustomTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@protocol VCaccountDelegate <NSObject>
- (void)changeHeaderphoto:(UIImage*) image;
- (void)changeHeaderName:(NSString*) name;
@end

//遵守修改昵称的协议
@interface accountControllerView : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UIImage* image;
@property (nonatomic, copy)NSString* userAccount;
/*
 在委托模式中，通常是一个对象将另一个对象设置为代理。如果代理属性使用strong强引用，那么A持有B，而B又可以通过代理方法回调A，这样就会形成循环引用，导致两个对象都无法被释放。使用weak可以打破这种循环引用，当没有其他强引用指向代理对象时，代理对象可以正常释放。
 */
@property (nonatomic, copy)NSString* stringOfname;
@property (nonatomic, weak)id <VCaccountDelegate> delegate;
- (void)change:(UIImage*)image;
- (void)changeName:(NSString*)name;
@end

NS_ASSUME_NONNULL_END
