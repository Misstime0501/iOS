//
//  FuncMacroDefine.h
//  CommunicationDemo
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#ifndef FuncMacroDefine_h
#define FuncMacroDefine_h


#ifdef DEBUG
#define HABLog(fmt, ...) NSLog((@"%s [%d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define HABLog(...)
#endif


#endif
