//
//  NSString+Help.h
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Help)

+(NSString *)AES128Encrypt:(NSString *)plainText withKey:(NSString *)key;

+(NSString *)AES128Decrypt:(NSString *)encryptText withKey:(NSString *)key;


@end
