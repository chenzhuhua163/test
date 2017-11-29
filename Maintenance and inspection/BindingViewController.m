//
//  BindingViewController.m
//  Maintenance and inspection
//
//  Created by Youxing_Wang on 17/4/29.
//  Copyright © 2017年 Youxing_Wang. All rights reserved.
//

#import "BindingViewController.h"

@interface BindingViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * textfieldB;

@property(nonatomic,strong)UITextField * textfieldJB;
@end

@implementation BindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(40, 280, self.view.bounds.size.width-80, 50)];
    
    button.backgroundColor = [UIColor  yellowColor];
    
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    button.clipsToBounds=YES;
    
    button.layer.cornerRadius=15;
    
    [button setTitle:@"确认重新绑定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(bindRFID) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    
    _textfieldB = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, self.view.bounds.size.width-80, 50)];
    
    _textfieldB.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textfieldB setTextAlignment:NSTextAlignmentLeft];
    
    _textfieldB.tag = 1008;
    
    _textfieldB.inputView=[[UIView alloc]initWithFrame:CGRectZero];
    
    [self.textfieldB setReturnKeyType:UIReturnKeyNext];
    
    _textfieldB.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _textfieldB.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _textfieldB.delegate = self;
    
    _textfieldB.placeholder = @"请刷旧的RFID";
    
    [self.view addSubview:_textfieldB];
    
    _textfieldJB = [[UITextField alloc]initWithFrame:CGRectMake(40, 190, self.view.bounds.size.width-80, 50)];
    
    _textfieldJB.borderStyle = UITextBorderStyleRoundedRect;
    
    [_textfieldJB setTextAlignment:NSTextAlignmentLeft];
    
    _textfieldJB.tag = 1009;
    
    _textfieldJB.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.textfieldJB setReturnKeyType:UIReturnKeyNext];
    
    _textfieldJB.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _textfieldJB.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _textfieldJB.delegate = self;
    
    _textfieldJB.placeholder = @"请刷新的RFID";
    
    [self.view addSubview:_textfieldJB];
    
    self.view.backgroundColor=[UIColor purpleColor];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];// 1
    [self.textfieldB becomeFirstResponder];// 2
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField.tag == 1008){
        
        [_textfieldB resignFirstResponder];
        
        [_textfieldJB resignFirstResponder];
        
    }else{
        
        [_textfieldB resignFirstResponder];
        
        [_textfieldJB resignFirstResponder];
        
    }
    
    return YES;
    
}
-(void)bindRFID{
     AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSFetchRequest *reqBind=[[NSFetchRequest alloc]init];
    reqBind.entity=[NSEntityDescription entityForName:@"Mapping" inManagedObjectContext:app.managedObjectContext];
    NSPredicate *preBind=[NSPredicate predicateWithFormat:@"rfCard=%@",self.textfieldB.text];
    reqBind.predicate=preBind;
    NSArray *objs=[app.managedObjectContext executeFetchRequest:reqBind error:nil];
   
    [objs.lastObject setObject:self.textfieldJB.text forKey:@"rfCard"];
    
    [app saveContext];
    
    
    
    
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
