import Foundation

struct MemoryIOAdapter: MemoryIOProvider {
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
            response.resultCode = Int32(error.code)
            return response
        }
    }
    
    func write(request: MemoryWriteRequest, session: MemoryIOWriteSession) throws -> MemoryWriteResponse {
        do {
            try targetMemIO.write(request.bytesToWrite,
                                  toAddress: request.address,
                                  pid: pid)
            var response = MemoryWriteResponse()
            response.address = request.address
            return response
        } catch let error as NSError {
            var response = MemoryWriteResponse()
            response.address = request.address
            response.resultCode = Int32(error.code)
            return response
        }
    }
}
