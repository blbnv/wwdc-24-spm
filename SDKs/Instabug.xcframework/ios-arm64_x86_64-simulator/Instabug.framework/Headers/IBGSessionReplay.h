//
//  IBGSessionReplay.h
//  InstabugSessionReplay
//
//  Created by Ahmed Salah on 27/08/2023.
//  Copyright © 2023 Instabug. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(SessionReplay)
@interface IBGSessionReplay : NSObject

/**
 @brief Enable/Disable Session Replay.
 
 Session Replay is enabled by default.
 @discussion Enabling Session Replay allows you to record and replay user sessions for better understanding of user interactions and issue resolutions.

 @code
 SessionReplay.enabled = true
 @endcode
 
 */
@property (class, atomic, assign) BOOL enabled;

/**
 @brief Enable/Disable recording network logs for Session Replay.
 
 Network log recording is enabled by default. It allows capturing network activity during Session Replay for better debugging and analysis.
 
 @code
 SessionReplay.networkLogsEnabled = true
 @endcode
 */
@property (class, atomic, assign) BOOL networkLogsEnabled;

/**
 @brief Enable/Disable recording Instabug logs for Session Replay.
 
 Instabug log recording is enabled by default. It allows capturing Instabug SDK logs during Session Replay, aiding in identifying issues.
 
 @code
 SessionReplay.IBGLogsEnabled = true
 @endcode
 */
@property (class, atomic, assign) BOOL IBGLogsEnabled;

/**
 @brief Enable/Disable recording user steps for Session Replay.
 
 User step recording is enabled by default. It allows capturing user interactions and navigation paths during Session Replay for comprehensive analysis.
 
 @code
 SessionReplay.userStepsEnabled = true
 @endcode
 */
@property (class, atomic, assign) BOOL userStepsEnabled;

/**
 @brief Export Current Session Replay Link. Current session Replay Link if found as optional String
 */
@property (class, atomic, assign, readonly, nullable) NSString *sessionReplayLink;

@end

NS_ASSUME_NONNULL_END
