//
//  Person.h
//  通讯录
//
//  Created by Alex on 2018/06/18.
//  Copyright © 2018年 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic)int pid;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *code;
@property (nonatomic,copy) NSString *email;
@property(nonatomic, strong) NSData *icon;
@end
