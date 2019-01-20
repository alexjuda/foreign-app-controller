import Foundation
import SwiftProtobuf
import SwiftGRPC

print("SwiftProtobuf version: ", SwiftProtobuf.Version.versionString)
print("SwiftGRPC version: ", SwiftGRPC.gRPC.version)

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

let coordinator = Coordinator(targetPID: pid)
coordinator.start()
print("Starting gRPC server on \(coordinator.serverAddress)")


RunLoop.current.run()
