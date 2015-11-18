//
//  CleanCaches.h
//  汽车百科
//
//  Created by dllo on 15/10/16.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CleanCaches : NSObject
//计算单个文件大小
+(long long)fileSizeAtPath:(NSString *)singlePath;
//计算文件夹大小
+(float)floderSizeAtPath:(NSString *)floderPath;
//清理缓存方法,返回值为清理之后缓存大小
+(NSString *)cleanAction;
@end
