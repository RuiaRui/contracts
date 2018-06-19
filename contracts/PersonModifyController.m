//
//  PersonModifyController.m
//  通讯录
//
//  Created by Alex on 2018/06/18.
//  Copyright © 2018年 Alex. All rights reserved.
//
#import "DBManager.h"
#import "PersonModifyController.h"
#import "Person.h"
@interface PersonModifyController ()
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@end

@implementation PersonModifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新建联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];
    
    
    if (self.person) {//修改
        self.nameTF.text = self.person.name;
        self.codeTF.text = self.person.code;
        self.emailTF.text=self.person.email;
    }
    
}

- (void)saveAction {
    
    if (self.person) {//修改
        self.person.name = self.nameTF.text;
        self.person.code = self.codeTF.text;
        self.person.email=self.emailTF.text;
        
        [[DBManager shareManager]updatePerson:self.person];
        
    }else{
        
        Person *p = [Person new];
        p.name = self.nameTF.text;
        p.code = self.codeTF.text;
        p.email=self.emailTF.text;
        
        [[DBManager shareManager]insertPerson:p];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
