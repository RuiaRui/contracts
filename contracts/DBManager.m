//
//  DBManager.m
//  contracts
//
//  Created by Alex on 2018/06/18.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import "DBManager.h"
static DBManager *_manager;
@implementation DBManager
+(DBManager *)shareManager{
    
    if (!_manager) {
        _manager = [DBManager new];
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/contracts.db"];
        _manager.db = [FMDatabase databaseWithPath:path];
        
        if ([_manager.db open]) {
            NSLog(@"打开数据库文件成功");
            
            
            if ([_manager.db executeUpdate:@"create table if not exists contracts (name text,code text,email text,pid integer primary key autoincrement)"]) {
                NSLog(@"创建表成功！");
                FMResultSet *count =[_manager.db executeQuery:@"select count(*) from contracts"];
                int num=0;
                while([count next]){
                    num=[count intForColumnIndex:0];
                    
                }
                if(num==0){
                    [_manager.db executeUpdate:@"insert into contracts (name, code, email) values ('Mary','12312341234','1234@qq.com')"];
                    [_manager.db executeUpdate:@"insert into contracts (name, code, email) values ('Peter','12312341235','1235@qq.com')"];
                    [_manager.db executeUpdate:@"insert into contracts (name, code, email) values ('Max','12312341236','1236@qq.com')"];
                }
              
                
            }else NSLog(@"创建表失败");
            
            
        }
        
    }
    
    return _manager;
}

-(void)insertPerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"insert into contracts (name, code, email) values ('%@','%@','%@')",person.name,person.code,person.email];
    if ([self.db executeUpdate:sql]) {
        NSLog(@"插入数据成功！");
    }else NSLog(@"插入数据失败");
    
}
-(void)deletePerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"delete from contracts where pid=%d",person.pid];
    if ([self.db executeUpdate:sql]) {
        NSLog(@"删除数据成功！");
    }else NSLog(@"删除数据失败！");
    
}
-(void)updatePerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"update contracts set name='%@', code='%@' ，email='%@' where pid=%d",person.name,person.code,person.email,person.pid];
    
    
    if ([self.db executeUpdate:sql]) {
        NSLog(@"修改数据成功！");
    }else NSLog(@"修改数据失败！");
    
}

-(NSMutableArray *)queryPersons{
    
        
    NSMutableArray *persons = [NSMutableArray array];
    
    FMResultSet *result = [self.db executeQuery:@"select * from contracts"];
    while ([result next]) {
        Person *p = [Person new];
        
        p.name = [result stringForColumn:@"name"];
        p.code = [result stringForColumn:@"code"];
        p.email=[result stringForColumn:@"email"];
        p.pid = [result intForColumn:@"pid"];
        
        [persons addObject:p];
    }
    
    return  persons;
    
}
@end
