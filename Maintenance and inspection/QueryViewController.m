//
//  QueryViewController.m
//  CRS Kirin
//
//  Created by Youxing_Wang on 16/12/14.
//  Copyright © 2016年 chuangshuo. All rights reserved.
//

#import "QueryViewController.h"
#import <QuartzCore/QuartzCore.h>
//#import "SettingCell.h"
#import "UITableView+DataSourceBlocks.h"
#import "TableViewWithBlock.h"
#import <Foundation/Foundation.h>
//#import "MainFormViewController.h"
#import "QueryNextTableViewCell.h"
#import "MDViewController.h"
#import "Header.h"
#import "NSObject+MyData.h"
#import "changeLanguage.h"



#define currentMonth [currentMonthString integerValue]
#define Color_RGB(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0]
@interface QueryViewController ()
{
    BOOL isOpened;
    
    BOOL isData;
    
}
@property (weak, nonatomic) IBOutlet UITextField *textFieldEnterDate;
@property (weak, nonatomic) IBOutlet UITextField *jTextFieldEnterDate;
@property (weak, nonatomic) IBOutlet UIToolbar *jToolbarCancelDone;
@property (weak, nonatomic) IBOutlet UIPickerView *jCustomPicker;
@property (weak, nonatomic) IBOutlet UIButton *querybtn;



- (IBAction)jActionCancel:(id)sender;



- (IBAction)jActionDone:(id)sender;

@end

@implementation
QueryViewController
{
    
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *DaysArray;
    NSArray *amPmArray;
    NSArray *hoursArray;
    NSMutableArray *minutesArray;
    
    NSString *currentMonthString;
    
    NSInteger selectedYearRow;
    NSInteger selectedMonthRow;
    NSInteger selectedDayRow;
    NSArray *factoryArr;
    
    BOOL firstTimeLoad;
   
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     isOpened=NO;
    
      isData = NO;

    [self changeLanguage];
    [self setBarButton];
    self.view.layer.contents=(id)([UIImage imageNamed:@"9"].CGImage);
    self.view.layer.backgroundColor=[UIColor clearColor].CGColor;
    //self.jCustomPicker.layer.contents=(id)([UIImage imageNamed:@"15"].CGImage);
    
    self.isnTextfile.autocapitalizationType=UITextAutocapitalizationTypeAllCharacters;
    self.lineTextField.autocapitalizationType=UITextAutocapitalizationTypeAllCharacters;
    
    factoryArr=@[@"F3",@"F4",@"F5",@"F7"];

    [self comBoxTableView:_tbviewfac textFile:_factoryTextField Button:_btfacButton data:factoryArr customCellBlock:^(NSIndexPath *indexPath) {
        
    }];
    firstTimeLoad = YES;
    
    NSString *cancel=[[changeLanguage bundle] localizedStringForKey:@"query_Date_cancel" value:nil table:@"language"];
    NSString *Done=[[changeLanguage bundle] localizedStringForKey:@"query_Date_done" value:nil table:@"language"];
    self.cancelBt.title=cancel;
    self.DoneBt.title=Done;

    self.textFieldEnterDate.delegate = self;
    self.textFieldEnterDate.tag = 100;
   
    self.jCustomPicker.hidden = YES;
    self.jCustomPicker.dataSource = self;
    self.jCustomPicker.delegate = self;
    self.jToolbarCancelDone.hidden = YES;
    self.jTextFieldEnterDate.delegate = self;
    self.jTextFieldEnterDate.tag = 1000;
    
    NSDate *date = [NSDate date];
    
    
    NSLog(@"DATA:%@",date);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *data=[NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    NSLog(@"data:%@",data);
    
    
    // Get Current Year
    [formatter setDateFormat:@"yyyy"];
    
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    
    
    // Get Current  Month
    
    [formatter setDateFormat:@"MM"];
    
    currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    
    
    // Get Current  Date
    
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    
    // Get Current  Hour
    [formatter setDateFormat:@"hh"];
    NSString *currentHourString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    // Get Current  Minutes
    [formatter setDateFormat:@"mm"];
    NSString *currentMinutesString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    
    // PickerView -  Years data
    
    yearArray = [[NSMutableArray alloc]init];
    
    
    for (int i = 2010; i <= 2050 ; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
        
    }
    
    
    // PickerView -  Months data
    
    
    monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    
    
    // PickerView -  Hours data
    
    
    hoursArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
    
    
    // PickerView -  Hours data
    
    minutesArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 60; i++)
    {
        
        [minutesArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
    
    
    
    // PickerView -  days data
    
    DaysArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 31; i++)
    {
        [DaysArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
    
    
    [self.jCustomPicker selectRow:[yearArray indexOfObject:currentyearString] inComponent:0 animated:YES];
    
    [self.jCustomPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
    
    [self.jCustomPicker selectRow:[DaysArray indexOfObject:currentDateString] inComponent:2 animated:YES];
    
    [self.jCustomPicker selectRow:[hoursArray indexOfObject:currentHourString] inComponent:3 animated:YES];
    
    [self.jCustomPicker selectRow:[minutesArray indexOfObject:currentMinutesString] inComponent:4 animated:YES];
    
    
    
    
    
    
}

-(void)setBarButton{
    
    NSString *query=[[changeLanguage bundle] localizedStringForKey:@"query_query" value:nil table:@"language"];
    UIBarButtonItem *leftBt=[[UIBarButtonItem alloc]initWithTitle:query style:UIBarButtonItemStylePlain target:self action:@selector(doQuery)];
    //leftBt.image=[UIImage imageNamed:@"Upload-vector"];
    
    self.navigationItem.leftBarButtonItem=leftBt;
    
    
//    UIBarButtonItem *rightBt=[[UIBarButtonItem alloc]initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(Candcelbt)];
//    //rightBt.image=[UIImage imageNamed:@"trash-vector"];
//    
//    self.navigationItem.rightBarButtonItem =rightBt;
    
    
}

-(void)changeLanguage{
    NSString *factory=[[changeLanguage bundle] localizedStringForKey:@"query_factory" value:nil table:@"language"];
    NSString *line=[[changeLanguage bundle] localizedStringForKey:@"query_line" value:nil table:@"language"];
    NSString *startDate=[[changeLanguage bundle] localizedStringForKey:@"query_startDate" value:nil table:@"language"];
    NSString *endDate=[[changeLanguage bundle] localizedStringForKey:@"query_endDate" value:nil table:@"language"];
    
    self.factoryLabel.text=factory;
    self.lineLabel.text=line;
    self.startDate.text=startDate;
    self.endDate.text=endDate;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    if (component == 0)
    {
        selectedYearRow = row;
        [self.jCustomPicker reloadAllComponents];
    }
    else if (component == 1)
    {
        selectedMonthRow = row;
        [self.jCustomPicker reloadAllComponents];
    }
    else if (component == 2)
    {
        selectedDayRow = row;
        [self.jCustomPicker reloadAllComponents];
        
    }
    
}


#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)view;
    
    
   
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        //[pickerLabel setFont:[UIFont boldSystemFontOfSize:18]];
         pickerLabel.adjustsFontSizeToFitWidth=YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        //[pickerLabel setBackgroundColor:[UIColor greenColor]];
        //pickerLabel.textColor=[UIColor clearColor];
        [pickerLabel setFont:[UIFont systemFontOfSize:15.0f]];
    }
    
    
    
    if (component == 0)
    {
        pickerLabel.text =  [yearArray objectAtIndex:row]; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text =  [monthArray objectAtIndex:row];  // Month
    }
    else if (component == 2)
    {
        pickerLabel.text =  [DaysArray objectAtIndex:row]; // Date
        
    }
    else if (component == 3)
    {
        pickerLabel.text =  [hoursArray objectAtIndex:row]; // Hours
    }
    else if (component == 4)
    {
        pickerLabel.text =  [minutesArray objectAtIndex:row]; // Mins
    }


    
    return pickerLabel;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 5;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0)
    {
        return [yearArray count];
        
    }
    else if (component == 1)
    {
        return [monthArray count];
    }
    else if (component == 2)
    { // day
        
        if (firstTimeLoad)
        {
            firstTimeLoad=NO;
            if (currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12)
            {
                return 31;
            }
            else if (currentMonth == 2)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
            }
            else
            {
                return 30;
            }
            
        }
        else
        {
           
            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11)
            {
                return 31;
            }
            else if (selectedMonthRow == 1)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
                
                
            }
            else
            {
                return 30;
            }
            
        }
        
        
    }
    else if (component == 3)
    { // hour
        
        return 23;
        
    }
    else
    { // min
        return 60;
    }

    
    
}



- (IBAction)jActionCancel:(id)sender {
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
//                         
//                         UIDevice *device=[UIDevice currentDevice];
//                         if(device.orientation==UIDeviceOrientationLandscapeLeft||device.orientation== UIDeviceOrientationLandscapeRight){
//                         self.jCustomPicker.hidden = YES;
//                         self.jToolbarCancelDone.hidden = YES;
//                         
//                         }
                         self.jCustomPicker.hidden = YES;
                         self.jToolbarCancelDone.hidden = YES;
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
    
}


- (IBAction)jActionDone:(id)sender {
    
    
    if (isData == YES) {
        
        self.textFieldEnterDate.text = [NSString stringWithFormat:@"%@-%@-%@ %@ : %@",[yearArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:1]],[DaysArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:2]],[hoursArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:3]],[minutesArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:4]]];
        
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
//                             UIDevice *device=[UIDevice currentDevice];
//                             if(device.orientation==UIDeviceOrientationLandscapeLeft||device.orientation== UIDeviceOrientationLandscapeRight){
//                                 self.jCustomPicker.hidden = YES;
//                                 self.jToolbarCancelDone.hidden = YES;
//                                 
//                             }
                             self.jCustomPicker.hidden = YES;
                             self.jToolbarCancelDone.hidden = YES;
                             
                         }
                         completion:^(BOOL finished){
                             
                             
                         }];
        
    }else{
    
        self.jTextFieldEnterDate.text = [NSString stringWithFormat:@"%@-%@-%@ %@ : %@",[yearArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:1]],[DaysArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:2]],[hoursArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:3]],[minutesArray objectAtIndex:[self.jCustomPicker selectedRowInComponent:4]]];
        
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
//                             UIDevice *device=[UIDevice currentDevice];
//                             if(device.orientation==UIDeviceOrientationLandscapeLeft||device.orientation== UIDeviceOrientationLandscapeRight){
//                                 self.jCustomPicker.hidden = YES;
//                                 self.jToolbarCancelDone.hidden = YES;
//                                 
//                             }
                             self.jCustomPicker.hidden = YES;
                             self.jToolbarCancelDone.hidden = YES;
                         }
                         completion:^(BOOL finished){
                             
                             
                         }];
    
    }
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.view endEditing:YES];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         if (textField.tag == 100) {
                             
                             self.jToolbarCancelDone.hidden = NO;
                             self.jCustomPicker.hidden = NO;
                             self.textFieldEnterDate.text = @"";
                             
                             isData = YES;
                             
                             
                        }else{

                             self.jToolbarCancelDone.hidden = NO;
                             self.jCustomPicker.hidden = NO;
                             self.jTextFieldEnterDate.text = @"";
                           
                            
                            isData = NO;
                         
                         }
                         
                         
                    }
                     completion:^(BOOL finished){
                         
                     }];

    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return  YES;
    
}

- (IBAction)btfacButton:(id)sender {
    
    [self showBoxFrameTableview:_tbviewfac isOpen:isOpened insertNum:factoryArr.count Block:^(BOOL opened) {
        
    }];
    isOpened=!isOpened;
    
}
- (IBAction)backKirin:(id)sender {
    
    
    
    MainFormViewController * main = [[MainFormViewController alloc]init];
    
    [self presentViewController:main animated:YES completion:nil];
    
    
}


- (void)doQuery{
    
    if(self.textFieldEnterDate.text.length&&self.jTextFieldEnterDate.text.length){
       
        


        
        NSDateFormatter *dataformatter=[[NSDateFormatter alloc]init];

        
        //转化为东八区时间
        [dataformatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
        
        [dataformatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSDate *startaDate=[dataformatter dateFromString:self.textFieldEnterDate.text];
        NSDate *stopDate=[dataformatter dateFromString:self.jTextFieldEnterDate.text];
         
        //计算时间间隔
        NSTimeInterval time=[stopDate timeIntervalSinceDate:startaDate];
        NSLog(@"textfile:%@  jtextgiel:%@",self.textFieldEnterDate.text,self.jTextFieldEnterDate.text);
        NSLog(@"time:%f starttime:%@ stoptime:%@",time,startaDate,stopDate);
        if(time>0&&time<=7*24*3600){
            
            //集成刷新控件
            //[self setupRefresh];
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
                MDViewController *MDVC = [[MDViewController alloc] initWithNibName:@"MDViewController_iPhone" bundle:nil];
                MDVC.isn=self.isnTextField.text;
                MDVC.line=self.lineTextField.text;
                MDVC.shop=self.factoryTextField.text;
                MDVC.startDate=self.stDateTextField.text;
                MDVC.endDate=self.endDateTextFied.text;
                
                
                [self presentViewController:MDVC animated:YES completion:nil];
            } else {
               MDViewController *MDVC = [[MDViewController alloc] initWithNibName:@"MDViewController_iPad" bundle:nil];
                MDVC.isn=self.isnTextField.text;
                MDVC.line=self.lineTextField.text;
                MDVC.shop=self.factoryTextField.text;
                MDVC.startDate=self.stDateTextField.text;
                MDVC.endDate=self.endDateTextFied.text;
                

                [self.navigationController pushViewController:MDVC animated:YES];
            }
            

        }else{
            
            NSString *alertDateError=[[changeLanguage bundle] localizedStringForKey:@"query_alert_dateError" value:nil table:@"language"];
            
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                self.alertLable.text=alertDateError;
                
                
            } completion:^(BOOL finished) {
                
                [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(dismissLable) userInfo:nil repeats:NO];
                
            }];
           
        }
    }else{
        NSString *alertPle=[[changeLanguage bundle] localizedStringForKey:@"query_alert_dateNull" value:nil table:@"language"];
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.alertLable.text=alertPle;
        } completion:^(BOOL finished) {
            
            [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(dismissLable) userInfo:nil repeats:NO];

        }];
        
       
    }
    
    
}



-(void)dismissLable{
    self.alertLable.text=@"";
}









@end
