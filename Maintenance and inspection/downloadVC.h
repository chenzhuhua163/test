//
//  downloadVC.h
//  Maintenance and inspection
//
//  Created by Youxing_Wang on 17/5/2.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+DataSourceBlocks.h"
@class TableViewWithBlock;
@interface downloadVC : UIViewController
@property(nonatomic,strong)TableViewWithBlock * lineTB;
@property(nonatomic,strong)UITextField *lineTF;
@property(nonatomic,strong)UITextField *IDTF;
@property(nonatomic,strong)UITableView *progressTb;

@end
