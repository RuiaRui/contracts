//
//  InfoViewController.m
//  contracts
//
//  Created bt Alex on 2018/6/18.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "InfoViewController.h"
#import "DBManager.h"
#import "PersonModifyController.h"
@interface InfoViewController ()
@property (weak,nonatomic) IBOutlet UILabel * name;
@property (weak,nonatomic) IBOutlet UILabel * phone;
@property (weak,nonatomic) IBOutlet UILabel * email;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.name.text = self.person.name;
    self.phone.text = self.person.code;
    self.email.text=self.person.email;
}
-(IBAction)delete:(id)sender{
    Person *p = self.person;
    
    [[DBManager shareManager]deletePerson:p];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)edit:(id)sender{
    PersonModifyController *vc = [PersonModifyController new];
    vc.person = self.person;
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)share:(id)sender{

    NSString *shareText = [NSString stringWithFormat:@"%@ %@",self.person.name,self.person.code];

    NSArray *activityItemsArray = @[shareText];
    
    UIActivity *uIActivity = [[UIActivity alloc] init];
    NSArray *activityArray = @[uIActivity];
    

    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItemsArray applicationActivities:activityArray];
    activityVC.modalInPopover = YES;

        UIActivityViewControllerCompletionWithItemsHandler itemsBlock = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
            NSLog(@"activityType == %@",activityType);
            if (completed == YES) {
            }else{
            }
        };
        activityVC.completionWithItemsHandler = itemsBlock;
    
    [self presentViewController:activityVC animated:YES completion:nil];
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
