//
//  NSObject+MydbData.m
//  CRS Kirin
//
//  Created by jack55_chen on 16/12/22.
//  Copyright © 2016年 chuangshuo. All rights reserved.
//

#import "NSObject+MyData.h"
#import "TableViewWithBlock.h"
#import "UITableView+DataSourceBlocks.h"
#import "JobNumberTableViewCell.h"


@implementation NSObject (MyData)



-(BOOL)ifExistsPlistFile{
    
        
    //获取本地沙盒路径
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //获取完整路径
        NSString *documentsPath = [path objectAtIndex:0];
         NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"content.plist"];
    
        NSFileManager *fileManager=[NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:plistPath]) {
            NSLog(@"文件存在地址为：%@",plistPath);
            return YES;
        }else{
            return NO;
        };

}

-(NSString *)getCompletePath:(NSString *)pathName{
    
    
    //获取本地沙盒路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:pathName];
    return filePath;
}
//封装下拉框，
//-(void)setComboBoxContent:(NSArray *)contentArray numberOfComboBox:(int)count tableViewOf:(TableViewWithBlock *)tableview textfield:(UITextField *)textfield tableViewCell:(UITableViewCell *)cell{
//    
//    
//    
//    
//    
//    [tableview initTableViewDataSourceAndDelegate:^(UITableView *tableView,NSInteger section){
//        return contentArray.count;
//        
//    } setCellForIndexPathBlock:^(UITableView *tableView,NSIndexPath *indexPath){
//         //tbcell=[tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
//    
//       UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
//        if (!cell) {
////            cell=[[[NSBundle mainBundle]loadNibNamed:@"SettingCell" owner:self options:nil]objectAtIndex:0];
////            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
//            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
//        }
//        //[cell.settingLable setText:_array[indexPath.row]];
//        [cell.textLabel setText:contentArray[indexPath.row]];
//        return cell;
//    } setDidSelectRowBlock:^(UITableView *tableView,NSIndexPath *indexPath){
////        SettingCell *cell=(SettingCell*)[tableView cellForRowAtIndexPath:indexPath];
////        
////        textfield.text=cell.settingLable.text;
//        
//                UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//                textfield.text=cell.textLabel.text;
//        _rowCount=indexPath.row;
//        NSLog(@"_rowCount:%ld",(long)_rowCount);
//        
//        _valueTextFile.text=@"";
//        [_contentTableView reloadData];
//    
//
//        
//        [_openSetButton sendActionsForControlEvents:UIControlEventTouchUpInside];
//    }];
//    
//    [_tbSet.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//    [_tbSet.layer setBorderWidth:2];
////
//}


//封装点击按钮弹出下拉框frame
-(void)showBoxFrameTableview:(UITableView *)tableview isOpen:(BOOL)isOpened insertNum:(NSInteger)number Block:(void(^)(BOOL opened))block{
    
    
    if (isOpened) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            CGRect frame=tableview.frame;
            
            frame.size.height=0;
            [tableview setFrame:frame];
            
        } completion:^(BOOL finished){
            
           
        }];
        
    }else{
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect frame=tableview.frame;
            
            
            
            if (number>5) {
                frame.size.height=5*30;
            }else{
                frame.size.height=number*30;
            }
            
            [tableview setFrame:frame];
        } completion:^(BOOL finished){
            
            
        }];
        
    }
    block(isOpened);
   
    
}

//封装mydb数据库
//查询数据库
-(void)inquiryMydb{
    
}

-(void)comBoxTableView:(TableViewWithBlock *)tableview  textFile:(UITextField *)textfile Button:(UIButton *)button data:(NSArray *)array  customCellBlock:(void(^)(NSIndexPath *indexPath))customCellHandle{
    

    
    [tableview initTableViewDataSourceAndDelegate:^(UITableView *tableView,NSInteger section){
        return array.count;
        
    } setCellForIndexPathBlock:^(UITableView *tableView,NSIndexPath *indexPath){
 
        JobNumberTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"SettingCell" owner:self options:nil]objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        [cell.JobNumber setText:array[indexPath.row]];
        
        
        return cell;
    } setDidSelectRowBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        JobNumberTableViewCell *cell=(JobNumberTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        textfile.text=cell.JobNumber.text;
        [button sendActionsForControlEvents:UIControlEventTouchUpInside];
        customCellHandle(indexPath);
        
        
    }];
    
    [tableview.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [tableview.layer setBorderWidth:2];
    
    
    
    
}












@end
