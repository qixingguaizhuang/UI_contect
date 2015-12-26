//
//  ThirdController.m
//  UI_分区练习
//
//  Created by dllo on 15/12/26.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ThirdController.h"

/** 联系人详情界面 */

@interface ThirdController ()

/* 右侧 */

@property (nonatomic, retain) UILabel *lableOfName;

@property (nonatomic, retain) UILabel *lableOfPhone;

@property (nonatomic, retain) UILabel *lableOfHobby;

/* 左侧 */
@property (nonatomic, retain) UILabel *lableOfLeftName;

@property (nonatomic, retain) UILabel *lableOfLeftPhone;

@property (nonatomic, retain) UILabel *lableOfLeftHobby;

@property (nonatomic, retain) UILabel *lableOfline;

@property (nonatomic, retain) UIImageView *imageViewOFhead;

@end


@implementation ThirdController

- (void)dealloc{

    [_lableOfHobby release];
    [_lableOfName release];
    [_lableOfPhone release];
    [_imageViewOFhead release];
    [_strOfhobby release];
    [_strOfName release];
    [_strOfPhone release];
    [_imageOfHead release];
    [_lableOfLeftName release];
    [_lableOfLeftPhone release];
    [_lableOfLeftHobby release];

    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatLabelOfName];
    [self creatLabelOfPhone];
    [self creatLabelOfHobby];
    [self creatLableOfLine];
    [self creatImageViewOfHead];
    
    /* 固定 label */
    
    [self creatLableOfLeftName];
    [self creatLableOfLeftPhone];
    [self creatLableOfLeftHobby];
    
}

/* 分割线 */

- (void)creatLableOfLine{
    
    self.lableOfline = [[UILabel alloc] initWithFrame:CGRectMake(50, 370, self.view.frame.size.width - 100, 0.5)];
    self.lableOfline.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.lableOfline];
    [_lableOfline release];

}


/* 联系人信息固定*/

- (void)creatLableOfLeftName{
    
    self.lableOfLeftName = [[UILabel alloc] initWithFrame:CGRectMake(60, 430, 120, 50)];
    self.lableOfLeftName.backgroundColor = [UIColor clearColor];
    self.lableOfLeftName.text = @"联 系 人  :";
    self.lableOfLeftName.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.lableOfLeftName];
    [_lableOfLeftName release];

}

- (void)creatLableOfLeftPhone{
    
    self.lableOfLeftPhone = [[UILabel alloc] initWithFrame:CGRectMake(60, 500, 120, 50)];
    self.lableOfLeftPhone.backgroundColor = [UIColor clearColor];
    self.lableOfLeftPhone.text = @"电话号码 :";
    self.lableOfLeftPhone.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.lableOfLeftPhone];
    [_lableOfLeftPhone release];

}

- (void)creatLableOfLeftHobby{
    
    self.lableOfLeftHobby = [[UILabel alloc] initWithFrame:CGRectMake(60, 570, 120, 50)];
    self.lableOfLeftHobby.backgroundColor = [UIColor clearColor];
    self.lableOfLeftHobby.text = @"个人爱好 :";
    self.lableOfLeftHobby.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.lableOfLeftHobby];
    [_lableOfLeftHobby release];

}




/* 联系人姓名 */

- (void)creatLabelOfName{
    
    self.lableOfName = [[UILabel alloc] initWithFrame:CGRectMake(170, 430, 220, 50)];
    self.lableOfName.backgroundColor = [UIColor clearColor];
    self.lableOfName.text = self.strOfName;
    self.lableOfName.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.lableOfName];
    [_lableOfName release];

}


/* 电话号码 */

- (void)creatLabelOfPhone{
    
    self.lableOfPhone = [[UILabel alloc] initWithFrame:CGRectMake(170, 500, 220, 50)];
    self.lableOfPhone.backgroundColor = [UIColor clearColor];
    self.lableOfPhone.text = self.strOfPhone;
    self.lableOfPhone.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.lableOfPhone];
    [_lableOfPhone release];

}

/* 爱好 */

- (void)creatLabelOfHobby{
    
    self.lableOfHobby = [[UILabel alloc] initWithFrame:CGRectMake(170, 570, 220, 50)];
    self.lableOfHobby.backgroundColor = [UIColor clearColor];
    self.lableOfHobby.text = self.strOfhobby;
    self.lableOfHobby.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.lableOfHobby];
    [_lableOfHobby release];
  
}


/* 头像 */

- (void)creatImageViewOfHead{

    self.imageViewOFhead = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageOfHead]];
    
    self.imageViewOFhead.frame = CGRectMake(90, 100, 230, 230);

    self.imageViewOFhead.backgroundColor = [UIColor cyanColor];
    
    self.imageViewOFhead.layer.cornerRadius = 115;
    
    self.imageViewOFhead.layer.masksToBounds = YES;
    
    [self.view addSubview:self.imageViewOFhead];
    
    [_imageViewOFhead release];


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
