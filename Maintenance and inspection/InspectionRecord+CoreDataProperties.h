//
//  InspectionRecord+CoreDataProperties.h
//  Maintenance and inspection
//
//  Created by jack55_chen on 17/5/12.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "InspectionRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface InspectionRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *dvs;
@property (nullable, nonatomic, retain) NSNumber *flag;
@property (nullable, nonatomic, retain) NSNumber *idx;
@property (nullable, nonatomic, retain) NSString *inpectionNotes;
@property (nullable, nonatomic, retain) NSString *inspectionPro;
@property (nullable, nonatomic, retain) NSString *inspectionStatus;
@property (nullable, nonatomic, retain) NSString *inspectionTime;
@property (nullable, nonatomic, retain) NSString *rfCat;
@property (nullable, nonatomic, retain) NSString *sn;

@end

NS_ASSUME_NONNULL_END
