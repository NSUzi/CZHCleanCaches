# CZHCleanCaches
Clear the Cache

1—先给出缓存路径
NSString *libraryPath =
[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
NSUserDomainMask, YES) lastObject];
        NSString *CachesPath = [libraryPath
stringByAppendingPathComponent:@"Caches"];\n
2—计算缓存大小(用类名调用)
[CleanCaches floderSizeAtPath:CachesPath]\n
3—清理缓存方法(类名调用)
[CleanCaches cleanAction]
