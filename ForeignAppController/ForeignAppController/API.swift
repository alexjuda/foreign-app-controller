//
//  API.swift
//  ForeignAppController
//
//  Created by Alexander Juda on 20/01/2019.
//  Copyright © 2019 Brand Amandli. All rights reserved.
//

import Foundation

struct APIMemoryIO: MemoryIOProvider {
    let targetMemIO = TargetMemoryIO()
    let pid: pid_t
    
    func read(request: MemoryReadRequest, session: MemoryIOReadSession) -> MemoryReadResponse {
        let data: Data
        do {
            data = try targetMemIO.readData(atAddress: request.address,
                                            bytesCount: request.bytesCount,
                                            pid: pid)
            
            
            var response = MemoryReadResponse()
            response.address = request.address
            response.readBytes = data
            return response
        } catch let error as NSError {
            var response = MemoryReadResponse()
            response.address = request.address
            response.kernelResult = Int32(error.code)
            return response
        }
    }
}
