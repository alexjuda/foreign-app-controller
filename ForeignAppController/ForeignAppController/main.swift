//
//  main.swift
//  ForeignAppController
//
//  Created by Alexander Juda on 20/01/2019.
//  Copyright © 2019 Brand Amandli. All rights reserved.
//

import Foundation
import SwiftProtobuf
import SwiftGRPC

print(SwiftProtobuf.Version.versionString)
print(SwiftGRPC.gRPC.version)

guard CommandLine.arguments.count >= 2 else {
    print("No target app bundle identifier provided!")
    abort()
}

let bundleIdentifier = CommandLine.arguments[1]

let finder = ProcessFinder()
guard let pid = finder.findPID(bundleIdentifier: bundleIdentifier) else {
    print("No app with bundle identifier '\(bundleIdentifier)' found!")
    abort()
}
