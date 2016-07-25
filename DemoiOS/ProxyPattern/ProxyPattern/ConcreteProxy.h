//
//  ConcreteProxy.h
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "AbastarctProxy.h"
#import "MessageProtocol.h"


@interface ConcreteProxy : AbastarctProxy <MessageProtocol>

@end
