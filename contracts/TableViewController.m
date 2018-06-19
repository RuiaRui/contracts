//
//  TableViewController.m
//  通讯录
//
//  Created by Alex on 2018/06/18.
//  Copyright © 2018年 Alex. All rights reserved.
//
#import "Person.h"
#import "DBManager.h"
#import "TableViewController.h"
#import "PersonModifyController.h"
#import "InfoViewController.h"
@interface TableViewController ()<UISearchBarDelegate>
@property (nonatomic, strong)NSMutableArray *persons;
@property Boolean child;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"通讯录";
    
    if(self.child == true)
        self.title = @"结果";
    if(self.child != true)
        self.tabBarController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    
    UISearchBar * aa=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 48)];
    aa.delegate = self;
    
    if(self.child != true)
        self.tableView.tableHeaderView = aa;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    TableViewController *tableViewController = [TableViewController new];
    tableViewController.persons = [self lookup:searchBar.text];
    tableViewController.child = true;
    [self.navigationController pushViewController:tableViewController animated:YES];
    
    
    
}

-(NSMutableArray *) lookup:(NSString *)name{
    NSMutableArray * c = [NSMutableArray new];
    NSIndexSet * d = [self.persons indexesOfObjectsPassingTest:^(id obj, NSUInteger idx, BOOL *stop){
        Person * person = (Person *) obj;
        if( [[NSString stringWithFormat:@"%@ %@",person.name,person.code] rangeOfString:name options:NSCaseInsensitiveSearch].location != NSNotFound ){
            [c addObject: self.persons[idx]];
            return YES;
        }
        return NO;
    }];
    return c;
}
- (void)addAction {
    
    PersonModifyController *vc = [PersonModifyController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(self.child != true)
        self.persons = [[DBManager shareManager]queryPersons];
    
    return self.persons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                      reuseIdentifier: @"cell"];
    }
    
    Person *p = self.persons[indexPath.row];
    
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.code;
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Person *p = self.persons[indexPath.row];
        
        [[DBManager shareManager]deletePerson:p];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Person *p = self.persons[indexPath.row];
    InfoViewController *vc = [InfoViewController new];
    vc.person = p;
    [self.navigationController pushViewController:vc animated:YES];
    
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

