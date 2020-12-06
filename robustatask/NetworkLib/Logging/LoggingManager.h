//
//  LoggingManager.h
//  testnetworkinObjc
//
//  Created by Moussa on 03/12/2020.
//

#import <Foundation/Foundation.h>

#ifndef LoggingManager_h
#define LoggingManager_h

@interface LoggingManager : NSObject
+(void)logError:(NSString*)msg;
+(void)initLogger;
@end
#endif /* LoggingManager_h */
