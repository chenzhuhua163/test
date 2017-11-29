//
//  NSObject+coreDataDB.m
//  Maintenance and inspection
//
//  Created by jack55_chen on 17/5/5.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import "NSObject+coreDataDB.h"

@implementation NSObject (coreDataDB)

-(NSManagedObjectContext *)createDBContext{
    //1.创建模型对象
    //获取模型路径
    
    NSURL *modelURL=[[NSBundle mainBundle] URLForResource:@"coreData" withExtension:@"momd"];
    //根据模型文件创建模型对象
    NSManagedObjectModel *modle=[[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
    //NSManagedObjectModel *modle=[NSManagedObjectModel mergedModelFromBundles:nil];
    //2.创建持久化助理
    //利用模型对象创建助理化对象
    NSPersistentStoreCoordinator *store=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:modle];
    
    //数据库名称和路径
    NSString *dbStr=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *sqlPath=[dbStr stringByAppendingString:@"mySqlite.sqlite"];
    NSLog(@"path=%@",sqlPath);
    NSURL *sqlURL=[NSURL fileURLWithPath:sqlPath];
    //设置迁移方案
    NSDictionary *options=@{
                            NSMigratePersistentStoresAutomaticallyOption:@YES,
                            NSInferMappingModelAutomaticallyOption:@YES
                            };
    
    //设置数据库相关信息
    NSError *error=nil;
    NSPersistentStore *persistentStory= [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlURL options:options error:nil];
    if (persistentStory==nil) {
        [NSException raise:@"添加数据库错误" format:@"%@", [error localizedDescription]];
        
    }
    
    //创建上下文
    NSManagedObjectContext *context=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    //关联持久化助理
    [context setPersistentStoreCoordinator:store];
    
    
    return context;

    
}


@end
