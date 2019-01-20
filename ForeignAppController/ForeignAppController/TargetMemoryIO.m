//
//  TargetMemoryIO.m
//  ForeignAppController
//
//  Created by Alexander Juda on 20/01/2019.
//  Copyright © 2019 Brand Amandli. All rights reserved.
//

#import "TargetMemoryIO.h"
#import <mach/mach_vm.h>

@implementation TargetMemoryIO

- (instancetype)init {
    self = [super init];
    if (self) {
        _pidTaskCache = [NSMutableDictionary new];
    }
    
    return self;
}

- (NSData *)readDataAtAddress:(uint32_t)address
                   bytesCount:(uint32_t)bytesCount
                          pid:(pid_t)pid
                        error:(NSError **)errorPointer {
    mach_port_t slaveTaskPort = [self taskPortForPID:pid];
    
    void *buffer = malloc(bytesCount);
    UInt64 readBytesCount;
    kern_return_t kr = mach_vm_read_overwrite(slaveTaskPort,
                                              address,
                                              bytesCount,
                                              (mach_vm_address_t)buffer,
                                              &readBytesCount);
    
    if (kr != KERN_SUCCESS) {
        *errorPointer = [NSError errorWithDomain:@"com.ba.ForeignAppController.TargetMemoryIO.KernelError"
                                            code:kr
                                        userInfo:nil];
        free(buffer);
        return nil;
    }
    
    if (readBytesCount != bytesCount) {
        *errorPointer = [NSError errorWithDomain:@"com.ba.ForeignAppController.TargetMemoryIO.ReadingError"
                                            code:-1
                                        userInfo:nil];
        free(buffer);
        return nil;
    }
    
    NSData *data = [NSData dataWithBytes:buffer length:readBytesCount];
    free(buffer);
    return data;
}

- (mach_port_t)taskPortForPID:(pid_t)pid {
    mach_port_t slaveTaskPort;
    
    NSNumber *cachedPort = self.pidTaskCache[@(pid)];
    if (cachedPort) {
        slaveTaskPort = cachedPort.unsignedIntValue;
    } else {
        task_for_pid(current_task(), pid, &slaveTaskPort);
        self.pidTaskCache[@(pid)] = @(slaveTaskPort);
    }
    
    return slaveTaskPort;
}

@end
