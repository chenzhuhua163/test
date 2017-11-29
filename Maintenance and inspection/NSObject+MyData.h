//
//  NSObject+MydbData.h
//  CRS Kirin
//
//  Created by jack55_chen on 16/12/22.
//  Copyright © 2016年 chuangshuo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class TableViewWithBlock;




@interface NSObject (MyData)


-(BOOL)ifExistsPlistFile;

-(NSString *)getCompletePath:(NSString *)pathName;
-(void)showBoxFrameTableview:(UITableView *)tableview isOpen:(BOOL)isOpened insertNum:(NSInteger)number Block:(void(^)(BOOL opened))block;

-(void)comBoxTableView:(TableViewWithBlock *)tableview  textFile:(UITextField *)textfile Button:(UIButton *)button data:(NSArray *)array  customCellBlock:(void(^)(NSIndexPath *indexPath))customCellHandle;

@end
