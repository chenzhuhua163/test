//
//  uploadVC.m
//  Maintenance and inspection
//
//  Created by Youxing_Wang on 17/5/2.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import "uploadVC.h"
#import "upLoadTableViewCell.h"
#define WIDTH (self.view.bounds.size.width-80)
@interface uploadVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *uploadTb;

@end

@implementation uploadVC
{
    
    BOOL _isAllSelected;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self SClabel];
    
    UITableView *table=[[UITableView alloc]initWithFrame:CGRectMake(40, 151, self.view.bounds.size.width-80, self.view.bounds.size.height-350) style:UITableViewStylePlain];
    
    table.delegate = self;
    
    table.dataSource = self;
    
    table.editing = YES;
    
    table.allowsMultipleSelectionDuringEditing = YES;
    
    [self.view addSubview:table];
    
    self.uploadTb = table;
    
    [table registerNib:[UINib nibWithNibName:@"upLoadTableViewCell" bundle:nil] forCellReuseIdentifier:@"uploadCell"];
    
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 100, (WIDTH/6)-5/6, 50)];
    
    lable1.textAlignment = NSTextAlignmentCenter;
    
    lable1.text = @"SN";
    
    [self.view addSubview:lable1];
    
    UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/6, 100, (WIDTH/6)-5/6, 50)];
    
    lable2.textAlignment = NSTextAlignmentCenter;
    
    lable2.text = @"DVS号";
    
    [self.view addSubview:lable2];
    
    UILabel * lable3 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/6+WIDTH/6, 100, (WIDTH/6)-5/6, 50)];
    
    lable3.textAlignment = NSTextAlignmentCenter;
    
    lable3.text = @"点检项目";
    
    [self.view addSubview:lable3];
    
    UILabel * lable4 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/6+WIDTH/6+WIDTH/6, 100, (WIDTH/6)-5/6, 50)];
    
    lable4.textAlignment = NSTextAlignmentCenter;
    
    lable4.text = @"点检状态";
    
    [self.view addSubview:lable4];
    
    UILabel * lable5 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/6+WIDTH/6+WIDTH/6+WIDTH/6, 100, (WIDTH/6)-5/6, 50)];
    
    lable5.textAlignment = NSTextAlignmentCenter;
    
    lable5.text = @"点检备注";
    
    [self.view addSubview:lable5];
    
    UILabel * lable6 = [[UILabel alloc]initWithFrame:CGRectMake(40+WIDTH/6+WIDTH/6+WIDTH/6+WIDTH/6+WIDTH/6, 100, (WIDTH/6)-5/6, 50)];
    
    lable6.textAlignment = NSTextAlignmentCenter;
    
    lable6.text = @"点检时间";
    
    [self.view addSubview:lable6];
    
    self.view.backgroundColor=[UIColor purpleColor];
    
    UIButton * allSelect= [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width/2-300),table.bounds.size.height+200,150, 50)];
    
    allSelect.backgroundColor = [UIColor yellowColor];
    
    allSelect.clipsToBounds=YES;
    
    allSelect.layer.cornerRadius=15;
    
    [allSelect setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [allSelect setTitle:@"全选" forState:UIControlStateNormal];
    
    
    
    [allSelect addTarget:self action:@selector(allselect:)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:allSelect];
    
    
    UIButton *uploadBt=[[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width/2)+150, table.bounds.size.height+200,150, 50)];
    
    uploadBt.backgroundColor = [UIColor yellowColor];
    
    uploadBt.clipsToBounds=YES;
    
    uploadBt.layer.cornerRadius=15;
    
    [uploadBt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [uploadBt setTitle:@"上传" forState:UIControlStateNormal];
    
    
    
    [uploadBt addTarget:self action:@selector(upload)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:uploadBt];


}

-(void)SClabel{
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 40, 80, 50)];
    
    nameLabel.text = @"姓名:";
    
    nameLabel.textColor = [UIColor greenColor];
    
    nameLabel.font = [UIFont systemFontOfSize:23];
    
    nameLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    [self.view addSubview:nameLabel];
    
    UILabel * nameLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(120, 40, 150, 50)];
    
    nameLabel1.text = @"上官云雀";
    
    nameLabel1.textColor = [UIColor greenColor];
    
    nameLabel1.font = [UIFont systemFontOfSize:23];
    
    nameLabel1.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    [self.view addSubview:nameLabel1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)allselect:(UIButton*)sender{
    
    if (_isAllSelected == NO) {
        
        _isAllSelected = YES;
        //[sender setTitle:@"取消"];
        
        
        
        for (int i = 0; i < 20; i++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.uploadTb selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        }
    } else {
        
        _isAllSelected = NO;
        //[sender setTitle:@"全选"];
        
        for (int i = 0; i < 20; i++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.uploadTb deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
    
}
-(void)upload{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    upLoadTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"uploadCell" forIndexPath:indexPath];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (WIDTH/6), 50)];
    
    label.text = @" 12345";
    
    [cell addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/6, 0, (WIDTH/6), 50)];
    
    label1.text = @" 436457";
    
    [cell addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/6+WIDTH/6, 0, (WIDTH/6), 50)];
    
    label2.text = @" MBASD";
    
    [cell addSubview:label2];
    
    UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/6+WIDTH/6+WIDTH/6, 0, (WIDTH/6), 50)];
    
    label3.text = @" OK";
    
    [cell addSubview:label3];
    
    UILabel * label4 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/6+WIDTH/6+WIDTH/6+WIDTH/6, 0, (WIDTH/6), 50)];
    
    label4.text = @" 需要更换";
    
    [cell addSubview:label4];
    
    UILabel * label5 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/6+WIDTH/6+WIDTH/6+WIDTH/6+WIDTH/6, 0, (WIDTH/6), 50)];
    
    label5.text = @" 10：00";
    
    [cell addSubview:label5];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"测试数据-%ld", (long)indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
