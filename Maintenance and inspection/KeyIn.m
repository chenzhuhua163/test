//
//  KeyIn.m
//  CRS Kirin
//
//  Created by jack55_chen on 16/12/8.
//  Copyright © 2016年 chuangshuo. All rights reserved.
//

#import "KeyIn.h"
#import "UITableView+DataSourceBlocks.h"
#import "TableViewWithBlock.h"
#import <Foundation/Foundation.h>
//#import "SettingViewController.h"
//#import "jShowContentTableViewCell.h"
//#import "NSObject+MyData.h"
//#import "Header.h"
//#import "changeLanguage.h"
//#import "changeLanguage.h"

@interface KeyIn ()
{
    //sqlite3 *databse;
     BOOL isOpened;
    NSMutableArray *insertPositonArr;
    NSMutableArray *insertAreaArr;
    NSMutableArray *insertClassArr;
    NSMutableArray *insertPheArr;
    NSMutableArray *insertResultArr;
    NSMutableArray *insertInfoArr;
    NSMutableArray *dataArr;
    BOOL ifInsert;

}

@end

@implementation KeyIn
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
    // Do any additional setup after loading the view from its nib.
    isOpened=NO;
    
    [self createDatabase];
    [self creatComBox];
    [self setBarButton];
    [self changeLanguage];
    self.view.layer.contents=(id)([UIImage imageNamed:@"12"].CGImage);
    self.view.layer.backgroundColor=[UIColor clearColor].CGColor;
    
    self.alertLable.hidden=YES;
    
    self.isnTexfile.autocapitalizationType=UITextAutocapitalizationTypeAllCharacters;
    
//    UIPinchGestureRecognizer *pinchRecogbizer=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchView:)];
//    
//        [self.view addGestureRecognizer:pinchRecogbizer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doUploadBadge) name:@"uploadKeyInBadge" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(creatComBox) name:@"uploadToLocal" object:nil];
}
-(void)doUploadBadge{
    [self createDatabase];
   
}
//系统自动调用
//-(void)viewDidLayoutSubviews{
//    
//    regularScreenFrame=self.tbShowContent.frame;
//    
//}
////只取第一次自动布局之后tableview的frame，解决捏合手势导致tableview的frame改变的问题,只在viewdidload调用一次此方法
//-(void)tableviewFrame{
//    changedFrame=regularScreenFrame;
//}
//-(void)viewDidAppear:(BOOL)animated{
//    regularScreenFrame=self.tbShowContent.frame;
//    [self.tbShowContent reloadData];
//}
//-(void)pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
//    UIView *view=self.tbShowContent;
//    if(pinchGestureRecognizer.state==UIGestureRecognizerStateBegan||pinchGestureRecognizer.state==UIGestureRecognizerStateChanged){
//        view.transform=CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
//        pinchGestureRecognizer.scale=1;
//        [self.tbShowContent reloadData];
//    }
//}

-(void)setBarButton{

  
    
    
}

-(void)creatComBox{
    
    //封装的方法
   // NSString *plistPath=[self getCompletePath:@"content.plist"];
    //根据路径获取到数据后保存在字典中：
    //NSMutableDictionary *datadic = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    //if (datadic==nil) {
//        insertPositonArr=[NSMutableArray array];
//        insertAreaArr=[NSMutableArray array];
//        insertPheArr=[NSMutableArray array];
//        insertClassArr=[NSMutableArray array];
//        insertResultArr=[NSMutableArray array];
//        insertInfoArr=[NSMutableArray array];
//    }else{
//        NSArray * StationArray = [datadic objectForKey:@"STATION"];
//        insertPositonArr= [NSMutableArray arrayWithArray:StationArray];
//        
//        NSArray * AreaArray = [datadic objectForKey:@"AREA"];
//        insertAreaArr= [NSMutableArray arrayWithArray:AreaArray];
//        
//        NSArray * PhenomenonArray = [datadic objectForKey:@"PHENOMENON"];
//        insertPheArr= [NSMutableArray arrayWithArray:PhenomenonArray];
//        
//        NSArray * TypeArray = [datadic objectForKey:@"TYPE"];
//        insertClassArr= [NSMutableArray arrayWithArray:TypeArray];
//        
//        NSArray * ResultArray = [datadic objectForKey:@"RESULT"];
//        insertResultArr= [NSMutableArray arrayWithArray:ResultArray];
//        
//        NSArray * NotesArray = [datadic objectForKey:@"NOTES"];
//        insertInfoArr= [NSMutableArray arrayWithArray:NotesArray];
//
//    }
//    
//    [self comBoxTableView:_tbPosition textFile:_positionTextfile Button:_stationButton data:insertPositonArr customCellBlock:^(NSIndexPath *indexPath) {
//    
//    }];
//    [self comBoxTableView:_tbArea textFile:_areaTextfile Button:_areaButton data:insertAreaArr customCellBlock:^(NSIndexPath *indexPath) {
//        
//    }];
//    [self comBoxTableView:_tbphe textFile:_pheTextfile Button:_pheButton data:insertPheArr customCellBlock:^(NSIndexPath *indexPath) {
//        
//    }];
//    [self comBoxTableView:_tbClass textFile:_classTextfile Button:_classButton data:insertClassArr customCellBlock:^(NSIndexPath *indexPath) {
//        
//    }];
//    [self comBoxTableView:_tbResult textFile:_resultTextfile Button:_resultButton data:insertResultArr customCellBlock:^(NSIndexPath *indexPath) {
//      
//    }];
//    [self comBoxTableView:_tbInfo textFile:_infoTextfile Button:_infoButton data:insertInfoArr customCellBlock:^(NSIndexPath *indexPath) {
//        
//    }];
//    
//    [self.tbPosition reloadData];
//    [self.tbArea reloadData];
//    [self.tbphe reloadData];
//    [self.tbClass reloadData];
//    [self.tbResult reloadData];
//    [self.tbInfo reloadData];
//    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Uploadbt{
    
    
    [self createDatabase];
    self.ISNlable.text=@"";
}

- (void)Candcelbt{
    self.ISNlable.text=@"";
    self.positionTextfile.text=@"";
    self.areaTextfile.text=@"";
    self.pheTextfile.text=@"";
    self.classTextfile.text=@"";
    self.resultTextfile.text=@"";
    self.infoTextfile.text=@"";
    [dataArr removeAllObjects];
    [self.tbShowContent reloadData];
    
    [self reloadInputViews];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    [self.ISNlable resignFirstResponder];
}
-(void)createDatabase{
    
    NSString *documentsPaths=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES)lastObject];
    NSString *databaseFilePath=[documentsPaths stringByAppendingPathComponent:@"mydb"];
    NSLog(@"shujuku dizhi:%@",databaseFilePath);
       // db=[FMDatabase databaseWithPath:databaseFilePath];
    //打开数据库
//        if ([db open]) {
//            NSLog(@"打开数据库");
//            
//        }
    
//    if (self.ISNlable.text.length&&self.positionTextfile.text.length&&self.areaTextfile.text.length&&self.pheTextfile.text.length&&self.classTextfile.text.length&&self.resultTextfile.text.length&&self.infoTextfile.text.length) {
//        
//        NSString *createSQL=@"create table if not exists q(id integer primary key autoincrement,isn text,position text,area text,phenomenon text, class text,result text,info text)";
////       BOOL ifCreate= [db executeUpdate:createSQL];
////        if (ifCreate) {
////            NSLog(@"创建表成功");
////        }
//        NSString *insertData=[NSString stringWithFormat:@"insert into q(isn,position,area,phenomenon,class,result,info) values('%@','%@','%@','%@','%@','%@','%@');",self.ISNlable.text,self.positionTextfile.text,self.areaTextfile.text,self.pheTextfile.text,self.classTextfile.text,self.resultTextfile.text,self.infoTextfile.text];
//        
//        //BOOL ifInserted=[db executeUpdate:insertData];
//        if (ifInserted) {
//            NSLog(@"插入数据成功");
//            //插入数据成功时调用
//            ifInsert=YES;
//            
//            if (dataArr==nil) {
//                dataArr=[[NSMutableArray alloc]init];
//                [dataArr addObject:self.ISNlable.text];
//                [dataArr addObject:self.positionTextfile.text];
//                [dataArr addObject:self.areaTextfile.text];
//                [dataArr addObject:self.pheTextfile.text];
//                [dataArr addObject:self.classTextfile.text];
//                [dataArr addObject:self.resultTextfile.text];
//                [dataArr addObject:self.infoTextfile.text];
//                
//            }else{
//                [dataArr addObject:self.ISNlable.text];
//                [dataArr addObject:self.positionTextfile.text];
//                [dataArr addObject:self.areaTextfile.text];
//                [dataArr addObject:self.pheTextfile.text];
//                [dataArr addObject:self.classTextfile.text];
//                [dataArr addObject:self.resultTextfile.text];
//                [dataArr addObject:self.infoTextfile.text];
//                
//            }
//            
//            
//            
//            [self.tbShowContent reloadData];
//
//        }
//        NSString *querySQL=@"select id,isn,position,area,phenomenon,class,result,info from q";
//        
//       FMResultSet *rs=[db executeQuery:querySQL];
//        while ([rs next]) {
//            
//        }
//    }else{
//        self.alertLable.hidden=NO;
//    }
//
//    
//        int count=[db intForQuery:@"select count(*) from q"];
//        if (count!=0) {
//            self.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",count];
//        }else{
//            self.tabBarItem.badgeValue=nil;
//        }
//
//        [db close];
    


        
        
        
//        
//    if(sqlite3_open(databaseFilePath.UTF8String,&databse )==SQLITE_OK){
//        NSLog(@"sqlite database open");
//        
//    }else{
//        
//       
//        NSLog(@"打开数据库失败");
//        return;
//    }
//    char *error;
//    const char *createSql="create table if not exists q(id integer primary key autoincrement,isn text,position text,area text,phenomenon text, class text,result text,info text)";
//    // NSString *sql=[NSString stringWithFormat:@"creat table if not exist"];
//    if(sqlite3_exec(databse, createSql, NULL, NULL, &error) ==SQLITE_OK){
//        NSLog(@"create table is ok");
//        
//    }else{
//        NSLog(@"error:%s",error);
//        sqlite3_free(error);
//    }
//  
//    const NSString *sql=[NSString stringWithFormat:@"insert into q(isn,position,area,phenomenon,class,result,info) values('%@','%@','%@','%@','%@','%@','%@');",self.ISNlable.text,self.positionTextfile.text,self.areaTextfile.text,self.pheTextfile.text,self.classTextfile.text,self.resultTextfile.text,self.infoTextfile.text];
//    NSLog(@"sql:%@",sql);
//        
//    
//    if(sqlite3_exec(databse,[sql UTF8String], NULL, NULL, &error)==SQLITE_OK){
//        NSLog(@"Insert is ok");
//        //插入数据成功时调用
//        ifInsert=YES;
//        
//        if (dataArr==nil) {
//            dataArr=[[NSMutableArray alloc]init];
//            [dataArr addObject:self.ISNlable.text];
//            [dataArr addObject:self.positionTextfile.text];
//            [dataArr addObject:self.areaTextfile.text];
//            [dataArr addObject:self.pheTextfile.text];
//            [dataArr addObject:self.classTextfile.text];
//            [dataArr addObject:self.resultTextfile.text];
//            [dataArr addObject:self.infoTextfile.text];
//            
//        }else{
//        [dataArr addObject:self.ISNlable.text];
//        [dataArr addObject:self.positionTextfile.text];
//        [dataArr addObject:self.areaTextfile.text];
//        [dataArr addObject:self.pheTextfile.text];
//        [dataArr addObject:self.classTextfile.text];
//        [dataArr addObject:self.resultTextfile.text];
//        [dataArr addObject:self.infoTextfile.text];
//            
//        }
//        
//        NSString *item=[NSString stringWithFormat:@"%d",++_uploadItemNum];
//        NSLog(@"COUNT:%d",self.uploadItemNum);
//        NSUserDefaults *keyinItem=[NSUserDefaults standardUserDefaults];
//        [keyinItem setObject:item forKey:@"KEYINITEM"];
//        [keyinItem synchronize];
//        
//        NSUserDefaults *itemNum=[NSUserDefaults standardUserDefaults];
//        self.tabBarItem.badgeValue=[itemNum valueForKey:@"KEYINITEM"];
//
//        [self.tbShowContent reloadData];
//        
//        
//    }else{
//        NSLog(@"error:%s",error);
//    }
//    const char *selectSql="select id,isn,position,area,phenomenon,class,result,info from q";
//    sqlite3_stmt *statement;
//    if(sqlite3_prepare_v2(databse, selectSql, -1, &statement, nil)==SQLITE_OK) {
//        NSLog(@"select is ok");
//    }else{
//        NSLog(@"error%s",error);
//    }
//    while (sqlite3_step(statement)==SQLITE_ROW) {
//        int _id=sqlite3_column_int(statement, 0                                                                                                                                                                                                   );
//        
//        NSString *_isn= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
//        NSString *_position= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
//        NSString *_area= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
//        NSString *_phe= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
//        NSString *_class= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 5)];
//        NSString *_result= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 6)];
//        NSString *_info= [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 7)];
//        
//        
//        
//        NSLog(@"row   id:%d isn:%@ 站位:%@ 区域:%@ 现象:%@,类别:%@,复判结果:%@,备注:%@",_id,_isn,_position,_area,_phe,_class,_result,_info);
//    }
//    sqlite3_close(databse);
//    }else{
//        self.alertLable.hidden=NO;
//    }
}
-(void)chooseComboxBt:(UIButton *)button reset:(BOOL)isReset{
    if (isReset) {
        self.areaButton.userInteractionEnabled=YES;
        self.stationButton.userInteractionEnabled=YES;
        self.classButton.userInteractionEnabled=YES;
        self.infoButton.userInteractionEnabled=YES;
        self.resultButton.userInteractionEnabled=YES;
        self.pheButton.userInteractionEnabled=YES;
    }else{
        NSMutableArray *btArray=[NSMutableArray array];
        [btArray addObject:self.areaButton];
        [btArray addObject:self.stationButton];
        [btArray addObject:self.classButton];
        [btArray addObject:self.infoButton];
        [btArray addObject:self.resultButton];
        [btArray addObject:self.pheButton];

        for (UIButton *bt in btArray) {
            if ([bt isEqual:button]) {
                bt.userInteractionEnabled=YES;
            }else{
                bt.userInteractionEnabled=NO;
            }
        }
    }
    
    
}
- (IBAction)staionSlecteTb:(id)sender {
    
    
//    [self showBoxFrameTableview:_tbPosition isOpen:isOpened insertNum:insertPositonArr.count Block:^(BOOL opened) {
//        
//        if (opened) {
//            
//            [self chooseComboxBt:sender reset:YES];
//            
//        }else{
//            [self chooseComboxBt:sender reset:NO];
//            
//        }
//        
//        isOpened=!isOpened;
//        
//       
//    }];
//    

    
    

}
- (IBAction)areaSlectTb:(id)sender {
    
//    
//    [self showBoxFrameTableview:_tbArea isOpen:isOpened insertNum:insertAreaArr.count Block:^(BOOL opened) {
//        if (opened) {
//            
//            [self chooseComboxBt:sender reset:YES];
//        }else{
//            [self chooseComboxBt:sender reset:NO];
//        }
//        
//    }];
//    isOpened=!isOpened;

}
- (IBAction)classSlectTb:(id)sender {
    
    
//    
//    [self showBoxFrameTableview:_tbClass isOpen:isOpened insertNum:insertClassArr.count Block:^(BOOL opened) {
//        if (opened) {
//            
//            [self chooseComboxBt:sender reset:YES];
//        }else{
//            [self chooseComboxBt:sender reset:NO];
//        }
//        
//    }];
//    isOpened=!isOpened;
    
    
}
- (IBAction)resultSlectTb:(id)sender {
    
    
//    
//    [self showBoxFrameTableview:_tbResult isOpen:isOpened insertNum:insertResultArr.count Block:^(BOOL opened) {
//        if (opened) {
//            
//            [self chooseComboxBt:sender reset:YES];
//        }else{
//            [self chooseComboxBt:sender reset:NO];
//        }
//        
//    }];
//    isOpened=!isOpened;
    

}
- (IBAction)infoSlectTb:(id)sender {
    
    
//    
//    [self showBoxFrameTableview:_tbInfo isOpen:isOpened insertNum:insertInfoArr.count Block:^(BOOL opened) {
//        if (opened) {
//            
//            [self chooseComboxBt:sender reset:YES];
//        }else{
//            [self chooseComboxBt:sender reset:NO];
//        }
//        
//    }];
//    isOpened=!isOpened;



}
- (IBAction)pheSelctTb:(id)sender {
    
    
//    
//    [self showBoxFrameTableview:_tbphe isOpen:isOpened insertNum:insertPheArr.count Block:^(BOOL opened) {
//        if (opened) {
//            
//            [self chooseComboxBt:sender reset:YES];
//        }else{
//            [self chooseComboxBt:sender reset:NO];
//        }
//        
//    }];
//    isOpened=!isOpened;

}

- (IBAction)returnMainForm:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count/7+1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse=@"jShowContentTableViewCell";
    //self.tbShowContent.showsHorizontalScrollIndicator=YES;
    self.tbShowContent.showsVerticalScrollIndicator=YES;
    //self.tbShowContent.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //self.tbShowContent.contentSize=CGSizeMake(639, 300);
    
//    
//    if (array==nil) {
//        array=[[NSMutableArray alloc]init];
//    }
//    [array addObject:NSStringFromCGRect(regularScreenFrame)];
//    self.tbShowContent.frame=regularScreenFrame;
//    
//    
//    NSLog(@"tbshowcontent.fram:%@ array:%@",NSStringFromCGRect(regularScreenFrame),array);
    self.tbShowContent.bounces=NO;
    
    [self.tbShowContent registerNib:[UINib nibWithNibName:@"jShowContentTableViewCell" bundle:nil]   forCellReuseIdentifier:reuse];
//    contentCell=[tableView dequeueReusableCellWithIdentifier:reuse forIndexPath:indexPath];
//    
//    if (contentCell==nil) {
//        contentCell=[[jShowContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
//    }
//    if (ifInsert) {
//        if(indexPath.row==0){
//            
//            contentCell.isnLable.text=@"ISN";
//            contentCell.positionLable.text=@"STATION";
//            contentCell.areaLable.text=@"AREA";
//            contentCell.pheLable.text=@"PHENOMENON";
//            contentCell.typeLabel.text=@"TYPE";
//            contentCell.resultLable.text=@"RESULT";
//            contentCell.infoLable.text=@"NOTES";
//
//        }else{
//        cell.isnLable.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//        cell.positionLable.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//        cell.areaLable.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//        cell.pheLable.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//        cell.typeLabel.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//        cell.resultLable.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//        cell.infoLable.font=[UIFont fontWithName:@"Helvetica" size:13.f];
//
//        
//            contentCell.isnLable.text=dataArr[7*(indexPath.row-1)+0];
//            contentCell.positionLable.text=dataArr[7*(indexPath.row-1)+1];
//            contentCell.areaLable.text=dataArr[7*(indexPath.row-1)+2];
//            contentCell.pheLable.text=dataArr[7*(indexPath.row-1)+3];
//            contentCell.typeLabel.text=dataArr[7*(indexPath.row-1)+4];
//            contentCell.resultLable.text=dataArr[7*(indexPath.row-1)+5];
//            contentCell.infoLable.text=dataArr[7*(indexPath.row-1)+6];
           
//            contentCell.isnLable.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//            contentCell.positionLable.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//
//            contentCell.areaLable.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//
//            contentCell.pheLable.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//
//            contentCell.typeLabel.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//
//            contentCell.resultLable.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//            contentCell.infoLable.textColor= [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
//            
//        }
//    }
//    
//    }
//    return contentCell;
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //return TABLEVIEW_CELL_HEGHT;
    return YES;
}

-(void)changeLanguage{
    [self.stationLable adjustsFontSizeToFitWidth];
    [self.areaLabel adjustsFontSizeToFitWidth];
    [self.pheLabel adjustsFontSizeToFitWidth];
    [self.typeLabel adjustsFontSizeToFitWidth];
    [self.resultLabel adjustsFontSizeToFitWidth];
    [self.notesLabel adjustsFontSizeToFitWidth];
//    
//    self.stationLable.text=[[changeLanguage bundle] localizedStringForKey:@"STATION" value:nil table:@"language"];
//    self.areaLabel.text=[[changeLanguage bundle] localizedStringForKey:@"AREA" value:nil table:@"language"];
//    self.pheLabel.text=[[changeLanguage bundle] localizedStringForKey:@"PHENOMENON" value:nil table:@"language"];
//    self.typeLabel.text=[[changeLanguage bundle] localizedStringForKey:@"TYPE" value:nil table:@"language"];
//    self.resultLabel.text=[[changeLanguage bundle] localizedStringForKey:@"RESULT" value:nil table:@"language"];
//    self.notesLabel.text=[[changeLanguage bundle] localizedStringForKey:@"NOTES" value:nil table:@"language"];

}
//适当的位置移除通知
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}











@end
