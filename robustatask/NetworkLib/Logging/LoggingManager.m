//
//  LoggingManager.m
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>
#import "LoggingManager.h"

int logLevel = 0;

@implementation LoggingManager
+(void)logError:(NSString*)msg
{
    if (logLevel == 0)
    {
        NSLog(@"%@", msg);
    }
    else
    {
        NSString* currentDateTime = [[NSString alloc] init];
        NSDate* now = [NSDate date];
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
        currentDateTime = [dateFormatter stringFromDate:now];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString* currentDate = [[NSString alloc] init];
        currentDate = [dateFormatter stringFromDate:now];
        NSString* fileName = [[NSString alloc] initWithFormat:@"%@_%@", currentDate, @"log.log"];
        NSString* filePath = [[self getLogFilePath] stringByAppendingString:fileName];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath: filePath] == false)
        {
            // create file
            [[NSFileManager defaultManager] createFileAtPath:filePath contents:[@"" dataUsingEncoding:NSUTF8StringEncoding] attributes:NULL];
        }
        
        NSFileHandle* fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[msg dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
    }
}

+(NSString*)getLogFilePath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* baseDir = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return [baseDir stringByAppendingPathComponent:@"Logs"];
}

+(void)initLogger
{
    [[NSFileManager defaultManager] createDirectoryAtPath:[self getLogFilePath]
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];
}
@end
