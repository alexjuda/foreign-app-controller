#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TargetMemoryIO : NSObject

@property (nonatomic, readonly) NSMutableDictionary<NSNumber *, NSNumber *> *pidTaskCache;

- (nullable NSData *)readDataAtAddress:(uint32_t)address
                            bytesCount:(uint32_t)bytesCount
                                   pid:(pid_t)pid
                                 error:(NSError **)errorPointer;

- (BOOL)writeData:(NSData *)data
        toAddress:(uint32_t)address
              pid:(pid_t)pid
     errorPointer:(NSError **)errorPointer;

@end

NS_ASSUME_NONNULL_END
