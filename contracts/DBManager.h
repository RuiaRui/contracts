//
//  DBManager.h
//  contracts
//
//  Created by Alex on 2018/06/18.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Person.h"
@interface DBManager : NSObject
@property (nonatomic, strong)FMDatabase *db;
+ (DBManager *)shareManager;

- (void)insertPerson:(Person *)person;

- (void)deletePerson:(Person *)person;

- (void)updatePerson:(Person *)person;

- (NSMutableArray *)queryPersons;


@end
