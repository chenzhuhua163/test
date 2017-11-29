//
//  KeyIn.h
//  CRS Kirin
//
//  Created by jack55_chen on 16/12/8.
//  Copyright © 2016年 chuangshuo. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SettingViewController.h"
#import "UITableView+DataSourceBlocks.h"
@class TableViewWithBlock;


@interface KeyIn : UIViewController<UITableViewDataSource,UITableViewDelegate>
   

@property (weak, nonatomic) IBOutlet UITextField *ISNlable;

@property (weak, nonatomic) IBOutlet UIButton *stationButton;
@property (weak, nonatomic) IBOutlet UIButton *areaButton;
@property (weak, nonatomic) IBOutlet UIButton *classButton;
@property (weak, nonatomic) IBOutlet UIButton *resultButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UIButton *pheButton;

@property (weak, nonatomic) IBOutlet UILabel *alertLable;

@property (weak, nonatomic) IBOutlet UITextField *isnTexfile;

@property (weak, nonatomic) IBOutlet UITextField *positionTextfile;
@property (weak, nonatomic) IBOutlet UITextField *areaTextfile;
@property (weak, nonatomic) IBOutlet UITextField *pheTextfile;

@property (weak, nonatomic) IBOutlet UITextField *classTextfile;

@property (weak, nonatomic) IBOutlet UITextField *resultTextfile;

@property (weak, nonatomic) IBOutlet UITextField *infoTextfile;
//label
@property (weak, nonatomic) IBOutlet UILabel *stationLable;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *pheLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;

@property (retain, nonatomic) IBOutlet TableViewWithBlock *tbPosition;

@property (weak, nonatomic) IBOutlet TableViewWithBlock *tbArea;
@property (weak, nonatomic) IBOutlet TableViewWithBlock *tbphe;
@property (weak, nonatomic) IBOutlet TableViewWithBlock *tbClass;

@property (weak, nonatomic) IBOutlet TableViewWithBlock *tbResult;

@property (weak, nonatomic) IBOutlet TableViewWithBlock *tbInfo;

@property (weak, nonatomic) IBOutlet UITableView *tbShowContent;


@property(assign,nonatomic)NSInteger uploadItemNum;

@end
