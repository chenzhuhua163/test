//
//  downloadVC.m
//  Maintenance and inspection
//
//  Created by Youxing_Wang on 17/5/2.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import "downloadVC.h"
#import "JobNumberTableViewCell.h"
#import "TableViewWithBlock.h"
#import "NSObject+MyData.h"
@interface downloadVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
    BOOL isOpened;
    NSMutableArray * _array;
    NSInteger _rowCount;

}

@end

@implementation downloadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UITableView * pgtable=[[UITableView alloc]initWithFrame:CGRectMake(40, 150, self.view.bounds.size.width-80, self.view.bounds.size.height-280) style:UITableViewStylePlain];
    
    pgtable.delegate = self;
    
    pgtable.dataSource = self;
    
    [self.view addSubview:pgtable];
    
    self.progressTb = pgtable;
    
    [pgtable registerNib:[UINib nibWithNibName:@"JobNumberTableViewCell" bundle:nil] forCellReuseIdentifier:@"PGCell"];
    
    
    self.view.backgroundColor=[UIColor purpleColor];
    
    _lineTF= [[UITextField alloc]initWithFrame:CGRectMake(40, 50, self.view.bounds.size.width/2-125, 50)];
    _lineTF.borderStyle = UITextBorderStyleRoundedRect;
    
    [_lineTF setTextAlignment:NSTextAlignmentLeft];
    
    _lineTF.tag = 1001;
    
    [_lineTF setReturnKeyType:UIReturnKeyNext];
    
    //    lineTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    //
    //    lineTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //lineTF.delegate = self;
    
    _lineTF.placeholder = @"请选择线体";
    
    _lineTF.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.lineTF setReturnKeyType:UIReturnKeyNext];
    
    _lineTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _lineTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    [self.view addSubview:_lineTF];
    
    UIButton * linebutton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-133, 51, 48, 48)];
    
    linebutton.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:linebutton];
    
    [linebutton addTarget:self action:@selector(BtnClick)forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *buttonImage = [UIImage  imageNamed:@"drop-down-vector"];
    UIImage *stretchableButtonImage = [buttonImage  stretchableImageWithLeftCapWidth:12  topCapHeight:0];
    [linebutton  setBackgroundImage:stretchableButtonImage  forState:UIControlStateNormal];
    
    _array = [[NSMutableArray alloc]initWithObjects:@"AREA",@"NOTES",@"PHENOMENON",@"RESULT" ,@"STATION",@"TYPE", nil];
    
    [self comBoxTableView:_lineTB textFile:_lineTF Button:linebutton data:_array customCellBlock:^(NSIndexPath *indexPath) {
        
        _rowCount = indexPath.row;
    
    }];
    
    UITableView * table=[[UITableView alloc]initWithFrame:CGRectMake(40, 99, self.view.bounds.size.width/2-125 , 0) style:UITableViewStylePlain];
    
    [self.view addSubview:table];
    
    self.lineTB = table;
//
//    [table registerNib:[UINib nibWithNibName:@"JobNumberTableViewCell" bundle:nil] forCellReuseIdentifier:@"JNID"];
    
    
    _IDTF= [[UITextField alloc]initWithFrame:CGRectMake(_lineTF.frame.size.width+40+20, 50,self.view.bounds.size.width/2-125, 50)];
    _IDTF.borderStyle = UITextBorderStyleRoundedRect;
    
    [_IDTF setTextAlignment:NSTextAlignmentLeft];
    
    _IDTF.tag = 1001;
    
    [_IDTF setReturnKeyType:UIReturnKeyNext];
    
    //    lineTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    //
    //    lineTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //lineTF.delegate = self;
    
    _IDTF.placeholder = @"请刷工号";
    
    _IDTF.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    

    [self.IDTF setReturnKeyType:UIReturnKeyNext];
    
    _IDTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _IDTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    [self.view addSubview:_IDTF];
    
    

    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(_IDTF.frame.size.width+_IDTF.frame.origin.x+20, 50,130, 50)];
    
    button.backgroundColor = [UIColor yellowColor];
    
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    
    button.clipsToBounds=YES;
    
    button.layer.cornerRadius=15;
    
    [button setTitle:@"更新" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(pushData)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
//    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(40, 190, self.view.bounds.size.width-80, self.view.bounds.size.height/2)];
//    
//    textView.layer.borderWidth=2;
//    textView.editable=NO;
//    textView.layer.borderColor=[UIColor blackColor].CGColor;
    
    
    
   // [self.view addSubview:textView];
}

-(void)BtnClick{
    
    [self showBoxFrameTableview:_lineTB isOpen:isOpened insertNum:_array Block:^(BOOL opened) {
        
    }];
    
    isOpened = !isOpened;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    JobNumberTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PGCell" forIndexPath:indexPath];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.view.bounds.size.width/2-125, 45)];
    
    label.text = @"sdfsdgsdgsdhslop";
    
    [cell addSubview:label];
    return cell;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)pushData{
    
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    //根据点检时间表，查询当前时间类可以点检的项目
    //获取当前时间
    NSDate *nowDate=[NSDate date];
    NSDateFormatter *formartter=[[NSDateFormatter alloc]init];
    [formartter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/shanghai"]];
    [formartter setDateFormat:@"HH:mm:ss"];
    
     NSString *nowStr=[formartter stringFromDate:nowDate];
   NSDate *localTime=[formartter dateFromString:nowStr];
    NSLog(@"nowDate:%@ nowstr:%@",nowDate,nowStr);
    
    NSFetchRequest *reqTime=[[NSFetchRequest alloc]init];
    reqTime.entity=[NSEntityDescription entityForName:@"InspectionTime" inManagedObjectContext:app.managedObjectContext];
    NSPredicate *preTime=[NSPredicate predicateWithFormat:@"startTime<=%@ AND endTime>=%@",localTime,localTime];
    //选择工号，在员工表里面找到工号所在的部门
    NSFetchRequest  *reqID=[[NSFetchRequest alloc]init];
    reqID.entity=[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:app.managedObjectContext];
    NSPredicate *preID=[NSPredicate predicateWithFormat:@"jobID=%d",self.IDTF.text];
    reqID.predicate=preID;
    NSArray *objsID=[app.managedObjectContext executeFetchRequest:reqID error:nil];
    NSString *department=[objsID.lastObject valueForKey:@"department"];
    
    //选择线体，根据dvs表找到dvs卡号
    
    NSFetchRequest *reqLine=[[NSFetchRequest alloc]init];
    
    reqLine.entity=[NSEntityDescription entityForName:@"DVS" inManagedObjectContext:app.managedObjectContext];
    
    NSPredicate *preLine=[NSPredicate predicateWithFormat:@"line=%@",self.lineTF.text];
    
    reqLine.predicate=preLine;
    
    NSArray *objsLine=[app.managedObjectContext executeFetchRequest:reqLine error:nil];
    
    
    for (NSManagedObject *obj in objsLine) {
        
       NSString *dvsCard= [obj valueForKey:@"dvsCard"];
        
        NSFetchRequest *reqdvsCd=[[NSFetchRequest alloc]init];
        reqdvsCd.entity=[NSEntityDescription entityForName:@"Mapping" inManagedObjectContext:app.managedObjectContext];
        
        NSPredicate *predvsCd=[NSPredicate predicateWithFormat:@"dvsCard=%@",dvsCard];
        
        reqdvsCd.predicate=predvsCd;
        
        NSArray *objsDVSCd=[app.managedObjectContext executeFetchRequest:reqdvsCd error:nil];
        
        for (NSManagedObject *obj in objsDVSCd) {
          NSNumber *rfcat=[obj valueForKey:@"rfCard"];
            NSFetchRequest *reqRFCd=[[NSFetchRequest alloc]init];
            reqRFCd.entity=[NSEntityDescription entityForName:@"Device" inManagedObjectContext:app.managedObjectContext];
            
            NSPredicate *preRFCd=[NSPredicate predicateWithFormat:@"rfCard=%@ AND ",rfcat];
        }
       
        
    }
    
    
    
    
    
    
    
    
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

@end
