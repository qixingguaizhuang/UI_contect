//
//  ViewController.m
//  UI_分区练习
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
#import "ThirdController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,secondViewDelegate>

@property (nonatomic , retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableDictionary *dicContact;
@property (nonatomic, retain) NSMutableArray *arrKey;

@end


@implementation ViewController

- (void)dealloc{

    [_tableView release];
    [_dicContact release];
    [_arrKey release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"通讯录";
   
    [self creatTableView];
    [self handleDateFromPlist];
    [self tableViewisEdit];
    [self addOfContant];

}

/** 创建 tableView */

- (void)creatTableView{

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 80;
    [_tableView release];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

}

/** 导入数据 */

- (void)handleDateFromPlist{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    self.dicContact = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
  //  self.arrKey = [self.dicContact allKeys].mutableCopy;
    
    /** key 分区排序 */
    
    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContact allKeys]];
    [self.arrKey sortUsingSelector:@selector(compare:)];

}


// 必须实现的两个代理方法

/** 每个分区的行数 每个分区有几个联系人,就有几个行数 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSString *key = [self.arrKey objectAtIndex:section];
    
    NSArray *arr = [self.dicContact objectForKey:key];

    return arr.count;

}

/** 重用池 ,cell 赋值 , 类型 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *poll1 = @"reuse1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:poll1] ;
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:poll1] autorelease];
    }
    
    
    /** 确定分区 section */
    
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    NSArray *arr = [self.dicContact objectForKey:key];
    
    /** 每个联系人的小字典 */
    
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"name"];
    
    NSLog(@"%@",cell.textLabel.text);
    
    //cell.detailTextLabel.text = [dic objectForKey:@"phone"];

    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"photo"]];
    
    cell.imageView.layer.cornerRadius = 40;
    
    cell.imageView.layer.masksToBounds = YES;

    return cell;

}

/** 索引 */


- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return self.arrKey;
    
}

/** 分区数 */

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{

    return  self.arrKey.count;

}

/** 分区的区头标题 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.arrKey objectAtIndex:section];
    
}


/** 编辑状态添加 */

- (void)tableViewisEdit{
    
    /** 利用 VC 的一个封装方法,在导航栏上添加一个 BarButton    self editButtonItem == self.editButtonItem  当点击此 button 时,调用下面的 setEding: animateted 方法*/
    
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
    
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    /** 必须先调用父类方法,点击后会有动作 */
    
    [super setEditing:editing  animated:animated];
    
    /** 让 TableView  进入/退出 编辑状态 */
    
    [self.tableView setEditing:editing  animated:animated];
    
}


/** 左上角添加按钮  " + " */

- (void)addOfContant{

  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addOfContantAction:)];

}


- (void)addOfContantAction:(UIButton *)button{
 
/** 添加方法 */
    
    SecondController *second = [[SecondController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
    second.delegate = self; /** 指定代理人*/
    [second release];

}


/** 实现协议方法,传值 */

- (void)textFieldOfchange:(NSMutableDictionary *) mdic{
    
    NSString *strOfgroup =[[mdic objectForKey:@"name"] substringToIndex:1].capitalizedString;

    NSMutableArray *marr = [NSMutableArray array];
    
    if ([self.arrKey containsObject:strOfgroup]) {
        
        marr = [self.dicContact objectForKey:strOfgroup];
        
        [marr addObject:mdic];
        
    }else{
        
        [self.dicContact setObject:marr forKey:strOfgroup];
        
        [self.arrKey addObject:strOfgroup];
        
        [self.arrKey sortUsingSelector:@selector(compare:)];
        
        [marr addObject:mdic];

    }

    
    [self.tableView reloadData];
}








//
///** 提交点击状态 */
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    /** 实现删除功能 */
//    
//    if (UITableViewCellEditingStyleDelete == editingStyle) {
//    
//        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
//        
//        [self.dicContact removeObjectForKey:key];
//  
//        /** tableView 删除 cell */
//        
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationRight];
//       }
//    
//}
//
//
///* 编辑风格 删除,默认状态是删除 */
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return 1;
//
//}
//






/** 第三页 联系人详情界面跳转 */



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    ThirdController *third = [[ThirdController alloc]init];
    
    
    // 确定分区 section
    
    NSString *key = [self.arrKey objectAtIndex:indexPath.section];
    
    NSArray *arr = [self.dicContact objectForKey:key];
    
    //每个联系人的小字典
    
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    
    /** 联系人 */
    
    third.strOfName = [dic objectForKey:@"name"];
    
    /* 电话 */
    
    third.strOfPhone = [dic objectForKey:@"phone"];
    
    /* 爱好 */
    
    third.strOfhobby = [dic objectForKey:@"hobby"];
    
    /*  头像 */
    
    third.imageOfHead = [dic objectForKey:@"photo"];

    
    NSLog(@"%@", third.imageOfHead);

    [self.navigationController pushViewController:third animated:YES];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
