//
//  InspectionViewController.m
//  Maintenance and inspection
//
//  Created by Youxing_Wang on 17/4/28.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import "InspectionViewController.h"
#import "BindingViewController.h"
#import "uploadVC.h"
#import "downloadVC.h"



#import "SSZipArchive.h"
#import <AFNetworking.h>
#import "NullSafe.m"
@interface InspectionViewController ()
{
    UIButton *downDataBt;
    UIButton *uploadBt;
    UIButton *upDataBt;
       
}

@end

@implementation InspectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor purpleColor];
    
    downDataBt= [[UIButton alloc]initWithFrame:CGRectMake(40, 300,self.view.bounds.size.width-80, 50)];
    
    downDataBt.backgroundColor = [UIColor yellowColor];
    
    [downDataBt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    downDataBt.clipsToBounds=YES;
    
    downDataBt.layer.cornerRadius=15;
    
    [downDataBt setTitle:@"是否开始下载初始资料" forState:UIControlStateNormal];
    
    [downDataBt addTarget:self action:@selector(downData)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:downDataBt];
    
    self.view.backgroundColor=[UIColor purpleColor];
    
    upDataBt= [[UIButton alloc]initWithFrame:CGRectMake(40, 390,self.view.bounds.size.width-80, 50)];
    
    upDataBt.backgroundColor = [UIColor yellowColor];
    
    [upDataBt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    upDataBt.clipsToBounds=YES;
    
    upDataBt.layer.cornerRadius=15;
    
    [upDataBt setTitle:@"是否更新资料" forState:UIControlStateNormal];
    
    [upDataBt addTarget:self action:@selector(upData)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:upDataBt];
    
    
    uploadBt= [[UIButton alloc]initWithFrame:CGRectMake(40, 480,self.view.bounds.size.width-80, 50)];
    
    uploadBt.backgroundColor = [UIColor yellowColor];
    
    [uploadBt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    uploadBt.clipsToBounds=YES;
    
    uploadBt.layer.cornerRadius=15;
    
    [uploadBt setTitle:@"上传资料" forState:UIControlStateNormal];
    
    [uploadBt addTarget:self action:@selector(upload)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:uploadBt];
    
    
}
-(void)upData{
    
    [self downDataInterface];
}

-(void)upload{
    
    
    
    uploadVC *upload=[[uploadVC alloc]init];
    [self.navigationController pushViewController:upload animated:YES];
}

-(void)downData{
    
    
   NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
   // NSString *caches=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *d_path=[NSString stringWithFormat:@"%@/json.zip",caches];
    //NSString *destination=[caches stringByAppendingString:@"/unzip"];
    AFHTTPSessionManager *sessionManager=[AFHTTPSessionManager manager];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://172.28.149.53/download/setup/Silence12.zip"]];
    NSURLSessionDownloadTask *task=[sessionManager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        return [NSURL fileURLWithPath:d_path];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        [SSZipArchive unzipFileAtPath:d_path toDestination:caches];
        [self readJsonFile];
        NSLog(@"caches:%@ response:%@ destination:%@",caches,response,caches);
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"下载成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
    }];
    [task resume];
    
   
    
}

-(void)readJsonFile{
   NSString *caches=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
   // NSString *caches=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"caches:%@",caches);
    
    NSString *dvspath=[caches stringByAppendingString:@"/Silence12/玻絬DVS.json"];
    NSString *devicepath=[caches stringByAppendingString:@"/Silence12/device_information_product.json"];
    NSString *employeepath=[caches stringByAppendingString:@"/Silence12/user.json"];
    NSString *checkListpath=[caches stringByAppendingString:@"/Silence12/pilot_mapping_product.json"];
    NSString *inspectionTimepath=[caches stringByAppendingString:@"/Silence12/pilot_frequency_product.json"];
    NSString *mappingpath=[caches stringByAppendingString:@"/Silence12/card_mapping.json"];
    
    NSString *dvs_jsonStr=[NSString stringWithContentsOfFile:dvspath encoding:NSUTF8StringEncoding error:nil];
    NSString *device_jsonStr=[NSString stringWithContentsOfFile:devicepath encoding:NSUTF8StringEncoding error:nil];
    NSString *employee_jsonStr=[NSString stringWithContentsOfFile:employeepath encoding:NSUTF8StringEncoding error:nil];
    NSString *checklist_jsonStr=[NSString stringWithContentsOfFile:checkListpath encoding:NSUTF8StringEncoding error:nil];
    NSString *inspectionTime_jsonStr=[NSString stringWithContentsOfFile:inspectionTimepath encoding:NSUTF8StringEncoding error:nil];
     NSString *mapping_jsonStr=[NSString stringWithContentsOfFile:mappingpath encoding:NSUTF8StringEncoding error:nil];
    
    
    NSData *dvs_jsonData=[[NSData alloc]initWithData:[dvs_jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *device_jsonData=[[NSData alloc]initWithData:[device_jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *employee_jsonData=[[NSData alloc]initWithData:[employee_jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *checklist_jsonData=[[NSData alloc]initWithData:[checklist_jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *inspectionTime_jsonData=[[NSData alloc]initWithData:[inspectionTime_jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *mapping_jsonData=[[NSData alloc]initWithData:[mapping_jsonStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableDictionary *dvs_jsonDic=[NSJSONSerialization JSONObjectWithData:dvs_jsonData options:NSJSONReadingMutableContainers error:nil];
    NSMutableDictionary *device_jsonDic=[NSJSONSerialization JSONObjectWithData:device_jsonData options:NSJSONReadingMutableContainers error:nil];
    NSMutableDictionary *employee_jsonDic=[NSJSONSerialization JSONObjectWithData:employee_jsonData options:NSJSONReadingMutableContainers error:nil];
    NSMutableDictionary *checklist_jsonDic=[NSJSONSerialization JSONObjectWithData:checklist_jsonData options:NSJSONReadingMutableContainers error:nil];
    NSMutableDictionary *inspectionTime_jsonDic=[NSJSONSerialization JSONObjectWithData:inspectionTime_jsonData options:NSJSONReadingMutableContainers error:nil];
     NSMutableDictionary *mapping_jsonDic=[NSJSONSerialization JSONObjectWithData:mapping_jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *dvs_jsonArr=dvs_jsonDic[@"RECORDS"];
    NSMutableArray *device_jsonArr=device_jsonDic[@"RECORDS"];
    NSMutableArray *emolyee_jsonArr=employee_jsonDic[@"RECORDS"];
    NSMutableArray *checklist_jsonArr=checklist_jsonDic[@"RECORDS"];
    NSMutableArray *inspectionTime_jsonArr=inspectionTime_jsonDic[@"RECORDS"];
    NSMutableArray *mapping_jsonArr=mapping_jsonDic[@"RECORDS"];
    
    
    for (NSDictionary *dic in dvs_jsonArr) {
        //NSManagedObjectContext *context=[self createDBContext];
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        DVS *dvs=[NSEntityDescription insertNewObjectForEntityForName:@"DVS" inManagedObjectContext:app.managedObjectContext];
        dvs.updateTime=dic[@"ModifyDate"];
        dvs.factory=dic[@"Factory"];
        dvs.section=dic[@"Section"];
        dvs.line=dic[@"Line"];
        dvs.station=dic[@"Station"];
        dvs.seat=dic[@"Seat"];
        dvs.dvs=dic[@"SeatId"];
        dvs.dvsCard=dic[@"CardNumber"];
        [app saveContext];
        
        
        //NSLog(@"dvs.dvsCard:%@ ",dic[@"CardNumber"]);
       // NSError *error=nil;
        
//        BOOL success=[app.managedObjectContext save:&error];
//        if (!success) {
//            [NSException raise:@"访问数据库失败" format:@"%@",[error localizedDescription]];
//        }else{
//            NSLog(@"保存成功");
//        }
        
        
        
        //NSLog(@"dvs.processSectiom:%@ ",dvs.processSectiom);
        // NSError *error=nil;
        //        BOOL success=[context save:&error];
        //        if (!success) {
        //            [NSException raise:@"访问数据库失败" format:@"%@",[error localizedDescription]];
        //        }else{
        //            NSLog(@"保存成功");
        //        }
        
    }
    
    for (NSDictionary *dic in device_jsonArr) {
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        
        Device *device=[NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:app.managedObjectContext];
        device.deviceName=dic[@"DEVICE_NAME"];
        device.deviceSN=dic[@"DEVICE_SN"];
        device.rfCard=dic[@"RFCARD"];
        device.updateTime=dic[@"TIME"];
        device.flag=dic[@"FLAG"];
        device.idx=dic[@"IDX"];
        device.department=dic[@"DEPARTMENT"];
        
        [app saveContext];
       // NSLog(@"device.updateTime:%@ ",device.updateTime);
        
    }
    
    for (NSDictionary *dic in emolyee_jsonArr) {
         AppDelegate *app = [UIApplication sharedApplication].delegate;
        
        Employee *user=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:app.managedObjectContext];
       // NSLog(@"user.uploadTime:%@ ",dic[@"TIME"]);
        user.name=dic[@"NAME"];
        user.department=dic[@"DEPARTMENT"];
        user.uploadTime=dic[@"TIME"];
        user.jobID=dic[@"ID"];
        user.flag=dic[@"FLAG"];
        user.idx=dic[@"IDX"];
        [app saveContext];
        
        
        
    }
    
    
    
    for (NSDictionary *dic in checklist_jsonArr) {
         AppDelegate *app = [UIApplication sharedApplication].delegate;
        
        CheckList *checkList=[NSEntityDescription insertNewObjectForEntityForName:@"CheckList" inManagedObjectContext:app.managedObjectContext];
        checkList.deviceName=dic[@"DEVICE_NAME"];
        checkList.inspectionPro=dic[@"CONTENT"];
        checkList.notes=dic[@"WAY"];
        checkList.updateTime=dic[@"TIME"];
        checkList.flag=dic[@"FLAG"];
        checkList.idx=dic[@"IDX"];
        [app managedObjectContext];
        
    }
    
    
    for (NSDictionary *dic in inspectionTime_jsonArr) {
         AppDelegate *app = [UIApplication sharedApplication].delegate;
        
        InspectionTime *InspectionTime=[NSEntityDescription insertNewObjectForEntityForName:@"InspectionTime" inManagedObjectContext:app.managedObjectContext];
        InspectionTime.deviceName=dic[@"DEVICE_NAME"];
       // InspectionTime.startTime=dic[@"STARTTIME"];
       // InspectionTime.endTime=dic[@"ENDTIME"];
        InspectionTime.updateTime=dic[@"TIME"];
        InspectionTime.flag=dic[@"FLAG"];
        InspectionTime.idx=dic[@"IDX"];
        [app saveContext];
        
    }
    
    
    for (NSDictionary *dic in mapping_jsonArr) {
         AppDelegate *app = [UIApplication sharedApplication].delegate;
        Mapping *mapping=[NSEntityDescription insertNewObjectForEntityForName:@"Mapping" inManagedObjectContext:app.managedObjectContext];
        mapping.dvsCard=dic[@"DVSCARD"];
        mapping.rfCard=dic[@"RFCARD"];
        mapping.department=dic[@"DEPARTMENT"];
        mapping.time=dic[@"TIME"];
        mapping.flag=dic[@"FLAG"];
        mapping.idx=dic[@"IDX"];
        [app saveContext];
        
    }
    
    
    
    
}


-(void)downDataInterface{
    
    downloadVC *downLoad=[[downloadVC alloc]init];
    [self.navigationController pushViewController:downLoad animated:YES];
    
    
    
//    progressTb=[[UITableView alloc]initWithFrame:CGRectMake(80, 190, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
//    
//    [self.view addSubview:progressTb];
    


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse=@"inspectiontProgress";
    //    //self.tbShowContent.showsHorizontalScrollIndicator=YES;
    //    self.tbShowContent.showsVerticalScrollIndicator=YES;
    //    //self.tbShowContent.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //    //self.tbShowContent.contentSize=CGSizeMake(639, 300);
    
   
   UITableViewCell  *cell=[tableView dequeueReusableCellWithIdentifier:reuse forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
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
