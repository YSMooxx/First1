//
//  PYAccount.m
//  Pythe
//
//  Created by yvtianshanshuo on 2017/6/20.
//  Copyright © 2017年 Dace. All rights reserved.
//

#import "Account.h"

static Account *account = nil;
@implementation Account

+ (instancetype)shareAccount
{
    if (!account)
    {
        account = [[self alloc] init];
    }
    return account;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        account = [super allocWithZone:zone];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        account.token = [defaults objectForKey:@"token"];
        account.deviceToken = [defaults objectForKey:@"deviceToken"];
        account.username = [defaults objectForKey:@"username"];
        account.phone = [defaults objectForKey:@"phone"];
        account.userId = [defaults objectForKey:@"userId"];
        account.psnID = [defaults objectForKey:@"psnID"];
        account.userimg = [defaults objectForKey:@"userimg"];
        account.zhantao = [defaults objectForKey:@"zhantao"];
        account.account = [defaults objectForKey:@"account"];
        account.version = [defaults objectForKey:@"version"];
        account.zhantaoName = [defaults objectForKey:@"zhantaoName"];
        account.zhantaoSName = [defaults objectForKey:@"zhantaoSName"];
        account.dept = [defaults objectForKey:@"dept"];
        account.voice = [defaults boolForKey:@"voice"];
        account.xs = [defaults integerForKey:@"xs"];
        account.systemId = [defaults integerForKey:@"systemId"];
    });
    
    return account;
}

- (BOOL)isLogin
{
    return self.token.length;
}

- (void)saveAccountToSandBox
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.token forKey:@"token"];
    [defaults setObject:self.deviceToken forKey:@"deviceToken"];
    [defaults setObject:self.username forKey:@"username"];
    [defaults setObject:self.phone forKey:@"phone"];
    [defaults setObject:self.userId forKey:@"userId"];
    [defaults setObject:self.psnID forKey:@"psnID"];
    [defaults setObject:self.userimg forKey:@"userimg"];
    [defaults setObject:self.version forKey:@"version"];
    [defaults setObject:self.zhantao forKey:@"zhantao"];
    [defaults setObject:self.account forKey:@"account"];
    [defaults setObject:self.zhantaoName forKey:@"zhantaoName"];
    [defaults setObject:self.zhantaoSName forKey:@"zhantaoSName"];
    [defaults setObject:self.dept forKey:@"dept"];
    [defaults setBool:self.voice forKey:@"voice"];
    [defaults setInteger:self.xs forKey:@"xs"];
    [defaults setInteger:self.systemId forKey:@"systemId"];
    
    [defaults synchronize];
}


@end
