//
//  BeiZiNetworking.h
//  BeiZiFoundation
//
//  Created by Arthur on 2021/7/5.
//

#import <Foundation/Foundation.h>
#import <Availability.h>
#import <TargetConditionals.h>

#ifndef _BeiZiNETWORKING_
    #define _BeiZiNETWORKING_

    #import "BeiZiURLRequestSerialization.h"
    #import "BeiZiURLResponseSerialization.h"
    #import "BeiZiSecurityPolicy.h"

#if !TARGET_OS_WATCH
    #import "BeiZiNetworkReachabilityManager.h"
#endif

    #import "BeiZiURLSessionManager.h"
    #import "BeiZiHTTPSessionManager.h"

#endif /* _BeiZiNETWORKING_ */
