import Foundation

let client = MemoryIOServiceClient(address: "localhost:1337",
                                   secure: false)

var request = MemoryReadRequest()
request.address = 14234260
request.bytesCount = 90

do {
    let response = try client.read(request)
    print(response.address)
    print(response.resultCode)
    print(response.readBytes as NSData)
    
    let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 90)
    response.readBytes.copyBytes(to: pointer, count: 90)
    let string = String(cString: pointer)
    print(string)
    
    pointer.deallocate()
} catch {
    print("Error: \(error)")
}


