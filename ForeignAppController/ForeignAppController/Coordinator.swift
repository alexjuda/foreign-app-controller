//
//  Coordinator.swift
//  ForeignAppController
//
//  Created by Alexander Juda on 20/01/2019.
//  Copyright © 2019 Brand Amandli. All rights reserved.
//

import Foundation
import SwiftGRPC
import AppKit

class Coordinator {
    let apiMemIO: APIMemoryIO
    let server: ServiceServer
    
    init(pid: pid_t) {
        apiMemIO = APIMemoryIO(pid: pid)
        server = ServiceServer(address: "localhost:1337", serviceProviders: [apiMemIO])
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