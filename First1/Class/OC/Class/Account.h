//
//  PYAccount.h
//  Pythe
//
//  Created by yvtianshanshuo on 2017/6/20.
//  Copyright © 2017年 Dace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

+ (instancetype)shareAccount;

@property (nonatomic,copy)NSString *token;
@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *psnID;
@property (nonatomic, copy)NSString *username;
@property (nonatomic, copy)NSString *phone;
@property (nonatomic, copy) NSString *userimg;
@property (nonatomic,copy)NSString *deviceToken;
@property (nonatomic,copy)NSString *version;
@property (nonatomic,copy)NSString *zhantao;
@property (nonatomic,copy)NSString *zhantaoName;
@property (nonatomic,copy)NSString *zhantaoSName;
@property (nonatomic,copy)NSString *account;
@property (nonatomic,copy)NSString *dept;
@property (nonatomic,assign)NSInteger xs;
@property (nonatomic,assign)BOOL voice;
@property (nonatomic,assign)NSInteger systemId;

- (void)saveAccountToSandBox;

@end
