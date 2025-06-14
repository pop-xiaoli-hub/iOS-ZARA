//
//  UserViewController.h
//  ZARA
//
//  Created by xiaoli pop on 2025/6/5.
//

#import <UIKit/UIKit.h>
#import "accountControllerView.h"
NS_ASSUME_NONNULL_BEGIN



@interface UserViewController : UITableViewController<VCaccountDelegate>
- (void)changeHeaderphoto:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
