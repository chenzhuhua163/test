//
//  QueryViewController.h
//  CRS Kirin
//
//  Created by Youxing_Wang on 16/12/14.
//  Copyright © 2016年 chuangshuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+DataSourceBlocks.h"
@class TableViewWithBlock;
@interface QueryViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *factoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *isnTextField;
@property (weak, nonatomic) IBOutlet UITextField *lineTextField;
@property (weak, nonatomic) IBOutlet UITextField *stDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *endDateTextFied;

@property (weak, nonatomic) IBOutlet UIButton *btfacButton;

@property (retain, nonatomic) IBOutlet TableViewWithBlock *tbviewfac;

@property (weak, nonatomic) IBOutlet UILabel *alertLable;

@property (weak, nonatomic) IBOutlet UITextField *isnTextfile;

//label
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
//button

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBt;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *DoneBt;

@property (weak, nonatomic) IBOutlet UILabel *factoryLabel;


@property(strong,nonatomic) NSMutableArray *isnArray;
@property(strong,nonatomic) NSMutableArray *seqArray;
@property(strong,nonatomic) NSMutableArray *shopArray;
@property(strong,nonatomic) NSMutableArray *lineArray;
@property(strong,nonatomic) NSMutableArray *stationArray;
@property(strong,nonatomic) NSMutableArray *areaArray;
@property(strong,nonatomic) NSMutableArray *pheArray;
@property(strong,nonatomic) NSMutableArray *typeArray;
@property(strong,nonatomic) NSMutableArray *opArray;
@property(strong,nonatomic) NSMutableArray *crsdataArray;
@property(strong,nonatomic) NSMutableArray *resultArray;
@property(strong,nonatomic) NSMutableArray *markArray;
@property(strong,nonatomic) NSMutableArray *notesArray;


@property (weak, nonatomic) IBOutlet UITableView *queryTb;

@end
