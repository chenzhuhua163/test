//
//  DVS+CoreDataProperties.h
//  Maintenance and inspection
//
//  Created by jack55_chen on 17/5/12.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DVS.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVS (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *dvs;
@property (nullable, nonatomic, retain) NSString *dvsCard;
@property (nullable, nonatomic, retain) NSString *factory;
@property (nullable, nonatomic, retain) NSString *line;
@property (nullable, nonatomic, retain) NSString *seat;
@property (nullable, nonatomic, retain) NSString *section;
@property (nullable, nonatomic, retain) NSString *station;
@property (nullable, nonatomic, retain) NSString *updateTime;

@end

NS_ASSUME_NONNULL_END
