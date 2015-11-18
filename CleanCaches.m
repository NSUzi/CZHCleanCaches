//
//  CleanCaches.m
//  汽车百科
//
//  Created by dllo on 15/10/16.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "CleanCaches.h"

@implementation CleanCaches
//计算单个文件大小方法
+(long long)fileSizeAtPath:(NSString *)singlePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:singlePath]) {
        return [[manager attributesOfItemAtPath:singlePath error:nil] fileSize];
    }else{
        return 0;
    }
}
//计算文件夹大小方法
+(float)floderSizeAtPath:(NSString *)floderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:floderPath]) {
        return 0;
    }
    //根据路径获取文件夹里面元素集合
    //获取集合类型的枚举器
    NSEnumerator *enumerator = [[manager subpathsAtPath:floderPath] objectEnumerator];
    //每次遍历得到的文件名
    NSString *fileName = [NSString string];
    //文件夹大小
    float folderSize = 0;
    
    while ((fileName = [enumerator nextObject]) != nil) {
        //拼接绝对路径
        NSString *absolutePath = [floderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:absolutePath];
    }
    return folderSize / (1024.0 * 1024.0);
}

//清理缓存方法
+(NSString *)cleanAction
{
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSString *cachesPath = [libraryPath stringByAppendingPathComponent:@"Caches"];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:cachesPath]) {
        //数组为所有文件的名字
        NSArray *fileNameArray = [manager subpathsAtPath:cachesPath];
        for (NSString *fileName in fileNameArray) {
            //拼接绝对路径
            NSString *absolutePath = [cachesPath stringByAppendingPathComponent:fileName];
            //通过文件管理者删除文件
            [manager removeItemAtPath:absolutePath error:nil];
        }
    }
//    return [NSString stringWithFormat:@"%.2fM", [self floderSizeAtPath:cachesPath]];
    return [NSString stringWithFormat:@"%.2fM", [CleanCaches floderSizeAtPath:cachesPath]];
}
@end
