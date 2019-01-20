import Foundation
import SwiftGRPC
import AppKit

class Coordinator {
    let memIO: MemoryIOAdapter
    let keyboardEffector: KeyboardEffector
    let server: ServiceServer
    
    init(targetPID: pid_t, serverAddress: String = "localhost:1337") {
        memIO = MemoryIOAdapter(pid: targetPID)
        keyboardEffector = KeyboardEffector(pid: targetPID)
        server = ServiceServer(address: serverAddress,
                               serviceProviders: [memIO, keyboardEffector])
    }
    
    func start() {
        server.start()
    }
    
    var serverAddress: String {
        return server.address
    }
}

class ProcessFinder {
    func findPID(bundleIdentifier: String) -> pid_t? {
        let app = NSWorkspace.shared.runningApplications
        .first { $0.bundleIdentifier == bundleIdentifier }
        
        return app?.processIdentifier
    }
}
