//
//  AppDelegate.m
//  CoinbaseGameCredit
//
//  Created by Andrew Ogden on 3/3/15.
//  Copyright (c) 2015 Andrew Ogden. All rights reserved.
//

#import "AppDelegate.h"
#import <coinbase-official/Coinbase.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Coinbase* apiClient = [Coinbase coinbaseWithApiKey:@"7OdIfjXEqUyqsDcD" secret:@"6Y2DuvAo8FAUxf96ZpSOlcjcwSN8GohH"];
    
//    [apiClient doGet:@"users/self" parameters:nil completion:^(id result, NSError *error) {
//        if (error) {
//            NSLog(@"Could not load user: %@", error);
//        } else {
//            NSLog(@"Signed in as: %@", [[result objectForKey:@"user"] objectForKey:@"email"]);
//        }
//    }];
    
//    NSMutableDictionary* postRequestParams = [NSMutableDictionary dictionary];
//    NSMutableDictionary* buttonParms = [NSMutableDictionary dictionary];
//    [buttonParms setObject:@"one credit" forKey:@"name"];
//    [buttonParms setObject:@"buy_now" forKey:@"type"];
//    [buttonParms setObject:@"false" forKey:@"subscription"];
//    [buttonParms setObject:@"0.0005" forKey:@"price_string"];
//    [buttonParms setObject:@"BTC" forKey:@"price_currency_iso"];
//    [buttonParms setObject:@"none" forKey:@"style"];
//    [postRequestParams setObject:buttonParms forKey:@"button"];
//    [apiClient doPost:@"buttons" parameters:postRequestParams completion:^(id result, NSError *error) {
//        if (error) {
//            NSLog(@"Could not create button: %@", error);
//        } else {
//            NSLog(@"Created button: %@", result);
//        }
//    }];
    
    [apiClient doPost:@"buttons/adb82d48d6db280c1b2169bf95ecbb73/create_order" parameters:nil completion:^(id result, NSError *error) {
        if (error) {
            NSLog(@"Could not create order: %@", error);
        } else {
            NSLog(@"Response: %@", result);
            NSDictionary* resultDict = (NSDictionary*)result;
            if(resultDict)
            {
                NSDictionary* order = [resultDict objectForKey:@"order"];
                if(order)
                {
                    NSString* receiveAddress = [order objectForKey:@"receive_address"];
                    NSLog(@"Receive address is %@",receiveAddress);
                }
            }
        }
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
