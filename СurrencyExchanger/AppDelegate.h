//
//  AppDelegate.h
//  СurrencyExchanger
//
//  Created by Vlad Burak on 17.03.2021.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

