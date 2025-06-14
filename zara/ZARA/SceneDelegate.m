//
//  SceneDelegate.m
//  ZARA
//
//  Created by xiaoli pop on 2025/6/5.
//

#import "SceneDelegate.h"
#import "HomeViewController.h"
#import "ShoppingViewController.h"
#import "UserViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    HomeViewController* vc1 = [[HomeViewController alloc] init];
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage systemImageNamed:@"house"] tag:101];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    ShoppingViewController* vc2 = [[ShoppingViewController alloc] init];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Shopping" image:[UIImage systemImageNamed:@"bag"] tag:102];
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    UserViewController* vc3 = [[UserViewController alloc] init];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"User" image:[UIImage systemImageNamed:@"person.circle"] tag:103];
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    
    NSArray* array = @[nav1, nav2, nav3];
    UITabBarController* tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = array;
    self.window.rootViewController = tabbarController;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
