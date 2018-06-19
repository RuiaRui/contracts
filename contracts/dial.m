//
//  dial.m
//  contracts
//
//  Created bt Alex on 2018/6/18.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "dial.h"

@interface dial ()
@property (weak,nonatomic) IBOutlet UILabel *label;
@end

@implementation dial

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.label.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)number:(id)sender{
    UIButton * c = (UIButton *) sender;
    self.label.text = [NSString stringWithFormat:@"%@%@",self.label.text,c.currentTitle];
}

-(IBAction)clear:(id)sender{
    self.label.text = @"";
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
