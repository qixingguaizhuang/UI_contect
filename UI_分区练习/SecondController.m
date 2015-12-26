//
//  SecondController.m
//  UI_分区练习
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "SecondController.h"
#import "LTView.h"



@interface SecondController () <UITextFieldDelegate>

@property(nonatomic, retain) UITextField *textFieldName;

@property (nonatomic, retain) UITextField *textFieldOfPhoneNumber;

@property(nonatomic, retain) UITextField *textFieldOfhobby;

@property (nonatomic, retain) UIImageView *imageViewOfHead;

@property (nonatomic, retain) UIImageView *imageViewOfBack;

@property (nonatomic, retain) UILabel *lableOfLine;

@end

@implementation SecondController

- (void)dealloc{

    [_textFieldName release];
    [_textFieldOfPhoneNumber release];
    [_imageViewOfBack release];
    [_imageViewOfHead release];
    [_lableOfLine release];
    [super dealloc];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self creatNameAndNumaber];
    [self creatImageViewOfHead];
    [self creatLableOfLine];
    [self addOfSave];
    
    
   
}


- (void)creatLableOfLine{
    
    
    self.lableOfLine = [[UILabel alloc] initWithFrame:CGRectMake(50, 370, self.view.frame.size.width - 100, 0.5)];
    
    self.lableOfLine.backgroundColor = [UIColor redColor];
    
    [self.imageViewOfBack addSubview:self.lableOfLine];
    
    [_lableOfLine release];
    
    
}




- (void)creatNameAndNumaber{
    
    
    self.imageViewOfBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b"]];
    
    self.imageViewOfBack.frame = self.view.frame;
    
    [self.view addSubview:self.imageViewOfBack];
    
    self.imageViewOfBack.userInteractionEnabled = YES;


    
    
    
    LTView *nameView = [[LTView alloc] initWithFrame:CGRectMake(40, 420, self.view.frame.size.width - 80, 60)];
    
    nameView.tag = 100;
    nameView.lableOfLeft.text = @"联系人:";
    
    nameView.textfieldOfright.placeholder = @"请输入联系人";
    
    nameView.textfieldOfright.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:nameView];

    [nameView release];
    
    
    
    LTView *viewOfKey = [[LTView alloc] initWithFrame:CGRectMake(40, 490, self.view.frame.size.width - 80, 60)];
    viewOfKey.tag = 200;
    viewOfKey.lableOfLeft.text = @"电话号码";
    
    viewOfKey.textfieldOfright.placeholder = @"请输入电话号码";
    
    viewOfKey.textfieldOfright.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:viewOfKey];
    
    [viewOfKey release];
    
    
    LTView *viewOfHobby = [[LTView alloc] initWithFrame:CGRectMake(40, 560, self.view.frame.size.width - 80, 60)];
    viewOfHobby.tag = 300;
    viewOfHobby.lableOfLeft.text = @"个人爱好";
    viewOfHobby.textfieldOfright.placeholder = @"请输入个人爱好";
    
    viewOfHobby.textfieldOfright.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:viewOfHobby];
    
    [viewOfHobby release];

    
    
    nameView.textfieldOfright.delegate = self;
    
    viewOfKey.textfieldOfright.delegate = self;
    
    viewOfHobby.textfieldOfright.delegate = self;

}


/* 背景向上滑动 协议方法 */

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    [UIView animateWithDuration:1 animations:^{
    
    self.imageViewOfBack.frame = CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height);
}];
    return YES;

}


 /*输入框将要返回,问代理如果文本框应该处理按下返回键*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    // 弹上去之后弹回
    
    [UIView animateWithDuration:0.22 animations:^{
        
        self.imageViewOfBack.frame = self.view.frame;
    }];
    
    // 第一响应 回收键盘 /通知接收器,它被要求放弃地位第一响应者的窗口。
    
    [textField resignFirstResponder];
    
     [self.view endEditing:YES];
    
    return YES;
    
}



/** 添加联系人头像 */


- (void)creatImageViewOfHead{

    self.imageViewOfHead = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"t2.jpg"]];
    
    self.imageViewOfHead.frame = CGRectMake(90, 100, 230, 230);
    
    self.imageViewOfHead.backgroundColor = [UIColor cyanColor];
    
    self.imageViewOfHead.layer.cornerRadius = 115;
    
    self.imageViewOfHead.layer.masksToBounds = YES;
    
    [self.imageViewOfBack addSubview:self.imageViewOfHead];
    
    [_imageViewOfHead release];



}



/** barItem 添加 save 按键*/

- (void)addOfSave{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addOfSaveAction:)];
    
}


- (void)addOfSaveAction:(UIButton *) button{
    
    [self.navigationController popViewControllerAnimated:YES];

    NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
    
    LTView *view = [self.view viewWithTag:100];
    
    LTView *viewOfphone = [self.view viewWithTag:200];
    
    LTView *viewOfHobby = [self.view viewWithTag:300];
    
    NSString *key = [NSString stringWithFormat:@"name"];
    
    
    [mdic setObject:view.textfieldOfright.text forKey:key];
    
    key = [NSString stringWithFormat:@"phone"];
    [mdic setObject:viewOfphone.textfieldOfright.text forKey:key];
    
    key = [NSString stringWithFormat:@"hobby"];
    [mdic setObject:viewOfHobby.textfieldOfright.text forKey:key];
    
    [self.delegate textFieldOfchange:mdic];
    
    NSLog(@"%@",mdic);


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
