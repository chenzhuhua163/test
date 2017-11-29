//
//  CheckList+CoreDataProperties.h
//  Maintenance and inspection
//
//  Created by jack55_chen on 17/5/12.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CheckList.h"

NS_ASSUME_NONNULL_BEGIN

@interface CheckList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *deviceName;
@property (nullable, nonatomic, retain) NSNumber *flag;
@property (nullable, nonatomic, retain) NSNumber *idx;
@property (nullable, nonatomic, retain) NSString *inspectionPro;
@property (nullable, nonatomic, retain) NSString *notes;
@property (nullable, nonatomic, retain) NSString *updateTime;

@end

NS_ASSUME_NONNULL_END
