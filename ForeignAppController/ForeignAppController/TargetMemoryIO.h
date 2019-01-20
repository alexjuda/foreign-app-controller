//
//  TargetMemoryIO.h
//  ForeignAppController
//
//  Created by Alexander Juda on 20/01/2019.
//  Copyright © 2019 Brand Amandli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TargetMemoryIO : NSObject

@property (nonatomic, readonly) NSMutableDictionary<NSNumber *, NSNumber *> *pidTaskCache;

- (nullable NSData *)readDataAtAddress:(uint32_t)address
                            bytesCount:(uint32_t)bytesCount
                                   pid:(pid_t)pid
                                 error:(NSError **)errorPointer;

@end

NS_ASSUME_NONNULL_END
