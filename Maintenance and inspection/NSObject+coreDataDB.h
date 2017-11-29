//
//  NSObject+coreDataDB.h
//  Maintenance and inspection
//
//  Created by jack55_chen on 17/5/5.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (coreDataDB)

-(NSManagedObjectContext *)createDBContext;

@end
