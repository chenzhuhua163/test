//
//  InterfaceViewController.m
//  Maintenance and inspection
//
//  Created by Youxing_Wang on 17/4/19.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import "InterfaceViewController.h"
#import "KeyIn.h"
#import "InspectionViewController.h"
#import "inspectiontTbCell.h"
#import "BindingViewController.h"
#define WIDTH (self.view.bounds.size.width-80)
@interface InterfaceViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSString *RFIDCard;
    NSString *DVSCard;
    NSString *cardID;
    NSString *jobID;
    NSString *deviceName;
    NSString *department;
    NSMutableArray *inspectionPro;
    NSMutableArray *inspectionNotes;
    NSString *processSection;
    NSDate   *lastDate;
    NSString *lastDateStr;
}

@property(nonatomic,strong)UITextField * textfield;
    
@property(nonatomic,strong)UITextField * textfieldT;
    
@property(nonatomic,strong)UITextField * textfieldE;

@property(nonatomic,strong)UITextField * textfieldF;

@property(nonatomic,strong)UILabel * lable;

@property(nonatomic,strong)UITableView *inspectionTb;


@end

@implementation InterfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * download = [[UIBarButtonItem alloc]initWithTitle:@"上传和下载" style:UIBarButtonItemStyleDone target:self action:@selector(isdownload)];
    self.navigationItem.rightBarButtonItem = download;
    
    UIBarButtonItem * binded = [[UIBarButtonItem alloc]initWithTitle:@"重新绑定" style:UIBarButtonItemStyleDone target:self action:@selector(isBinded)];
    self.navigationItem.leftBarButtonItem = binded;
    
    self.view.backgroundColor = [UIColor purpleColor];
    
     _textfield = [[UITextField alloc]initWithFrame:CGRectMake(40, 40, self.view.bounds.size.width-200, 50)];
      _textfield.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textfield setTextAlignment:NSTextAlignmentLeft];
    
    _textfield.tag = 1001;
    
//    _textfield.inputView=[[UIView alloc]initWithFrame:CGRectZero];
//    
//    [self.textfield setReturnKeyType:UIReturnKeyNext];
//    
//    _textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//    
//    _textfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _textfield.delegate = self;
    
    _textfield.placeholder = @"请刷RFID";
    
    [self.view addSubview:_textfield];
    
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(_textfield.frame.size.width+40+20, 40,100, 50)];
    
    button.backgroundColor = [UIColor yellowColor];
    
    button.clipsToBounds=YES;
    
    button.layer.cornerRadius=15;
    
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [button setTitle:@"开始点检" forState:UIControlStateNormal];
    
    
    
    [button addTarget:self action:@selector(BtnClick:)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

    
    _textfieldT = [[UITextField alloc]initWithFrame:CGRectMake(40, 130, self.view.bounds.size.width/2-50, 50)];
    
    _textfieldT.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textfieldT setTextAlignment:NSTextAlignmentLeft];
    
    _textfieldT.tag = 1002;
    
    _textfieldT.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.textfieldT setReturnKeyType:UIReturnKeyNext];
    
    _textfieldT.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _textfieldT.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _textfieldT.delegate = self;
    
    _textfieldT.placeholder = @"请刷DVS";
    
    [self.view addSubview:_textfieldT];

    
    _textfieldE = [[UITextField alloc]initWithFrame:CGRectMake(_textfieldT.frame.size.width+40+20, 130, self.view.bounds.size.width/2-50, 50)];
    _textfieldE.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textfieldE setTextAlignment:NSTextAlignmentLeft];
    
    _textfieldE.tag = 1003;
    
    _textfieldE.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.textfieldE setReturnKeyType:UIReturnKeyNext];
    
    _textfieldE.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _textfieldE.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _textfieldE.delegate = self;
    
    _textfieldE.placeholder = @"请刷ID卡";
    
    [self.view addSubview:_textfieldE];
    
    
    _textfieldF = [[UITextField alloc]initWithFrame:CGRectMake(40, 220, self.view.bounds.size.width-80, 50)];
    _textfieldF.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textfieldF setTextAlignment:NSTextAlignmentLeft];
    
    _textfieldF.tag = 1004;
    
    _textfieldF.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.textfieldF setReturnKeyType:UIReturnKeyNext];
    
    _textfieldF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _textfieldF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _textfieldF.delegate = self;
    

    _textfieldF.placeholder = @"设备信息...";
    
    [self.view addSubview:_textfieldF];
    
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(40, 310, (WIDTH/3)-2/3, 50)];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    lable.text = @"点检项目";
    lable.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:lable];
    
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/3+1, 310, (WIDTH/3)-2/3, 50)];
    
    lable1.textAlignment = NSTextAlignmentCenter;
    
    lable1.text = @"点检状态";
    
    [self.view addSubview:lable1];
    
    
    
    UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/3+WIDTH/3+1, 310, (WIDTH/3)-2/3, 50)];
    
    lable2.textAlignment = NSTextAlignmentCenter;
    
    lable2.text = @"点检备注";
    
    [self.view addSubview:lable2];
    
    UITableView * table=[[UITableView alloc]initWithFrame:CGRectMake(40, 361, WIDTH+1, self.view.bounds.size.height-450) style:UITableViewStylePlain];
    
    table.delegate = self;
    
    table.dataSource = self;
    
    [self.view addSubview:table];
    
    self.inspectionTb = table;
   
    [table registerNib:[UINib nibWithNibName:@"inspectiontTbCell" bundle:nil] forCellReuseIdentifier:@"CellID"];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];// 1
    [self.textfield becomeFirstResponder];// 2
}

- (void)BtnClick:(UIButton *)btn{
    
    RFIDCard=self.textfield.text;
    DVSCard=self.textfieldT.text;
    cardID=self.textfieldE.text;
    
   [self startInspection];
    self.textfieldF.text=[NSString stringWithFormat:@"设备名称:%@  部门:%@",deviceName,department];
    
//    
//    InspectionViewController * keyin = [[InspectionViewController alloc]init];
//    
//    [self.navigationController pushViewController:keyin animated:YES];

    
}

-(void)startInspection{
    
    
     AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //刷RFID
    //设置查询请求
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    //设置查询的实体
    request.entity=[NSEntityDescription entityForName:@"Device" inManagedObjectContext:app.managedObjectContext];
    
    //设置条件过滤,抓出RFID卡号
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"rfCard=%@",RFIDCard];
    request.predicate=predicate;
    //执行请求
    NSError *error=nil;
    NSArray *objs=[app.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@",[error localizedDescription]];
    }
    //根据设备号取设备类型，出现多条结果取时间最大的一笔，其他删除
//    if (objs.count>1) {
//        
//        for (NSManagedObject *obj in objs) {
//            
//            
//            NSString *update=[obj valueForKey:@"updateTime"];
//            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//            [formatter setLocale:[NSLocale currentLocale]];
//            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
//            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss\n"];
//            NSDate *updateDate=[formatter dateFromString:update];
//            //laterDate=[updateDate laterDate:laterDate];
//            
//            //时间的比较 返回枚举值
//            NSComparisonResult result=[lastDate compare:updateDate];
//            if (result==NSOrderedAscending){
//                
//                NSPredicate *predicateTime=[NSPredicate predicateWithFormat:@"updateTime=%@",lastDateStr];
//                request.predicate=predicateTime;
//                NSError *err=nil;
//                NSArray *objs=[contex executeFetchRequest:request error:&err];
//                [contex deleteObject:objs.lastObject];
//                //[contex save:nil];
//                
//                //                if (![contex save:&err])
//                //                {
//                //                    NSLog(@"error:%@",err);
//                //                }
//                NSLog(@"lastDate:%@较updateDate:%@早",lastDateStr,update);
//                
//                lastDate=updateDate;
//                lastDateStr=[formatter stringFromDate:lastDate];
//                
//                
//            }else if(result==NSOrderedSame){
//                
//                NSLog(@"lastDate:%@较updateDate:%@相等",lastDateStr,update);
//                
//                lastDate=updateDate;
//                lastDateStr=[formatter stringFromDate:lastDate];
//                
//            }else if(result==NSOrderedDescending){
//                
//                NSPredicate *predicateTime=[NSPredicate predicateWithFormat:@"updateTime=%@",update];
//                request.predicate=predicateTime;
//                NSError *err=nil;
//                NSArray *objs=[contex executeFetchRequest:request error:&err];
//                [contex deleteObject:objs.lastObject];
//                
//                //                if (![contex save:&err])
//                //                {
//                //                    NSLog(@"error:%@",err);
//                //                }
//                //
//                NSLog(@"lastDate:%@较updateDate:%@晚",lastDateStr,update);
//                
//            }
//            
//        }
//        
//    }
    
    //无论有没有多笔数据，得到的都是时间最大的一笔数据
    deviceName=[objs.lastObject valueForKey:@"deviceName"];
    department=[objs.lastObject valueForKey:@"department"];
    lastDate=nil;
    lastDateStr=nil;
    
    
    
    //根据设备名称抓出点检项目
    inspectionPro=[[NSMutableArray alloc]init];
    inspectionNotes=[[NSMutableArray alloc]init];
    
    NSFetchRequest *reqInpection=[[NSFetchRequest alloc]init];
    reqInpection.entity=[NSEntityDescription entityForName:@"CheckList" inManagedObjectContext:app.managedObjectContext];
    NSPredicate *preInpection=[NSPredicate predicateWithFormat:@"deviceName=%@",deviceName];
    reqInpection.predicate=preInpection;
    NSError *errInpection=nil;
    NSArray *objsInspection=[app.managedObjectContext executeFetchRequest:reqInpection error:&errInpection];
    if (errInpection) {
        [NSException raise:@"查询错误" format:@"%@",[error localizedDescription]];
    }
    for (NSManagedObject *obj in objsInspection) {
      NSString *inspection=[obj valueForKey:@"inspectionPro"];
        NSString *notes=[obj valueForKey:@"notes"];
        [inspectionPro addObject:inspection];
        [inspectionNotes addObject:notes];
    }
    
    
    
    
    //刷DVS卡号
    
    NSFetchRequest *reqDVS=[[NSFetchRequest alloc]init];
    
    reqDVS.entity=[NSEntityDescription entityForName:@"DVS" inManagedObjectContext:app.managedObjectContext];
    NSPredicate *preDVS=[NSPredicate predicateWithFormat:@"dvsCard=%@",DVSCard];
    reqDVS.predicate=preDVS;
    NSArray  *objsDVS=[app.managedObjectContext executeFetchRequest:reqDVS error:nil];
//    //显示制程段
//    processSection=[objsDVS.lastObject valueForKey:@"processSectiom"];
    
    //根据dvs号抓取mapping表里面的RFID卡号
    NSFetchRequest *reqMapping=[[NSFetchRequest alloc]init];
    reqMapping.entity=[NSEntityDescription entityForName:@"Mapping" inManagedObjectContext:app.managedObjectContext];
    NSPredicate *preMapping=[NSPredicate predicateWithFormat:@"dvsCard=%@",DVSCard ];
    reqMapping.predicate=preMapping;
    NSArray *objsMapping=[app.managedObjectContext executeFetchRequest:reqMapping error:nil];
    //mapping 表一个DVS号可对应多个多个RFID
    
    BOOL isFinish=YES;
    for (NSManagedObject *objc in objsMapping) {
        
        NSString *rfCard= [objc valueForKey:@"rfCard"];
        //根据设备号去抓取点检记录表的点检状态，是否已经点检完成
        NSFetchRequest *reqInspectionRecord=[[NSFetchRequest alloc]init];
        reqInspectionRecord.entity=[NSEntityDescription entityForName:@"InspectionRecord" inManagedObjectContext:app.managedObjectContext];
        NSPredicate *preInspectionRecord=[NSPredicate predicateWithFormat:@"rfCard=%@",rfCard];
        reqInspectionRecord.predicate=preInspectionRecord;
        NSArray *objsRecord=[app.managedObjectContext executeFetchRequest:reqInspectionRecord error:nil];
        
        
        
        NSString *ifFinish=[objsRecord.lastObject valueForKey:@"inspectionStatus"];
        if ([ifFinish isEqualToString:@"NG"]) {
            isFinish=NO;
            NSLog(@"点检项目未完成");
            break;
        }
        
    }
    if (isFinish) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点检项目完成,请刷入工号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];

        
        //输入工号。根据卡号抓取employee表里的工号
        NSFetchRequest *reqEmployee=[[NSFetchRequest alloc]init];
        reqEmployee.entity=[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:app.managedObjectContext];
        NSPredicate *preEmployee=[NSPredicate predicateWithFormat:@"cardID=%@",cardID];
        reqEmployee.predicate=preEmployee;
        NSArray *objsEmployee=[app.managedObjectContext executeFetchRequest:reqEmployee error:nil];
        jobID =[objsEmployee.lastObject valueForKey:@"jobID"];
        
    }else{
        //提示点检项目未完成
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点检项目未完成" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
    
    
    }
    
    NSLog(@"deviceName:%@ inspectionPro:%@  processSection:%@ jobid:%@",deviceName,inspectionPro,processSection,jobID);
    [self.inspectionTb reloadData];
    
}



-(void)isdownload{
    
    
//    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"下载成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//    [myAlertView show];
    
    InspectionViewController *downLoad=[[InspectionViewController alloc]init];
    [self.navigationController pushViewController:downLoad animated:YES];
    
    
}
-(void)isBinded{
    
    BindingViewController * bind = [[BindingViewController alloc]init];
    
    [self.navigationController pushViewController:bind animated:YES];

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == 1001) {
        
        [_textfield resignFirstResponder];
        
        if (_textfield.text == nil) {
           
            _textfieldF.placeholder = @"设备信息";
            
        }else{
            
            _textfieldF.text = @"信息设备是指计算机、通信及办公自动化设备等和信息部门的建筑物等硬件设施。";
            
        }
        
        [_textfieldT becomeFirstResponder];
        
    }else if (textField.tag == 1002){
        
        [_textfieldT resignFirstResponder];
        
        [_textfieldE becomeFirstResponder];
    }else if (textField.tag == 1003){
        
        [_textfieldE resignFirstResponder];
        
        [_textfieldF resignFirstResponder];
        
    }else{
        
        [_textfield resignFirstResponder];
        
        [_textfieldT resignFirstResponder];
        
        [_textfieldE resignFirstResponder];
        
        [_textfieldF resignFirstResponder];
        
    }
    
    return YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return inspectionPro.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//      static NSString *reuse=@"inspectiontTbCell";
////    //self.tbShowContent.showsHorizontalScrollIndicator=YES;
////    self.tbShowContent.showsVerticalScrollIndicator=YES;
////    //self.tbShowContent.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
////    //self.tbShowContent.contentSize=CGSizeMake(639, 300);
//    
//    [self.inspectionTb registerNib:[UINib nibWithNibName:@"inspectiontTbCell" bundle:nil]   forCellReuseIdentifier:reuse];
//     inspectiontTbCell  *cell=[tableView dequeueReusableCellWithIdentifier:reuse forIndexPath:indexPath];
//    
//        if (cell==nil) {
//        cell=[[inspectiontTbCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
//            
//            cell.textLabel.text = @"aaaaa";
//            
//            
//    }
//    
//        return cell;
    
    inspectiontTbCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, (WIDTH/3)-2/3, 50)];
    
    label.text = inspectionPro[indexPath.row];
    
    [cell addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3+5, 0, (WIDTH/3)-2/3, 50)];
    
    label1.text = @"OK";
    
    [cell addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3+WIDTH/3+5, 0, (WIDTH/3)-2/3, 50)];
    
    label2.text = inspectionNotes[indexPath.row];
    
    [cell addSubview:label2];
    
    
    UILabel * labelX = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3,0 , 1, 50)];
    
    labelX.backgroundColor = [UIColor purpleColor];
    
    [cell addSubview:labelX];
    
    UILabel * labelX2 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3+WIDTH/3,0 , 1, 50)];
    
    labelX2.backgroundColor = [UIColor purpleColor];
    
    [cell addSubview:labelX2];
    //cell.textLabel.text = [NSString stringWithFormat:@"测试数据-%ld", (long)indexPath.row];

    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}









@end
