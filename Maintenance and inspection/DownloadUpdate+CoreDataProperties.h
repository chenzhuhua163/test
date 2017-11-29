//
//  DownloadUpdate+CoreDataProperties.h
//  Maintenance and inspection
//
//  Created by jack55_chen on 17/5/10.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DownloadUpdate.h"

NS_ASSUME_NONNULL_BEGIN

@interface DownloadUpdate (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *deviceTime;
@property (nullable, nonatomic, retain) NSString *dvsTime;
@property (nullable, nonatomic, retain) NSString *mappingTime;
@property (nullable, nonatomic, retain) Device *deviceUpdateTime;
@property (nullable, nonatomic, retain) DVS *dvsUpdateTime;
@property (nullable, nonatomic, retain) Mapping *mappingUpdateTime;

@end

NS_ASSUME_NONNULL_END
