//
//  encoderUseJson.h
//  EncoderDemo
//
//  Created by LiChen on 6/27/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface encoderUseJson : NSObject

+ (NSDictionary *)getDictionaryFromObject:(id)classInstance;

+ (NSData *)encoder:(NSObject *)object;

+ (id)decoder:(NSData *)data;

@end
