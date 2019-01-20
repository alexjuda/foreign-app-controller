// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: API.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct MemoryReadRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var address: UInt32 = 0

  var bytesCount: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct MemoryReadResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var address: UInt32 = 0

  var readBytes: Data = SwiftProtobuf.Internal.emptyData

  var kernelResult: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension MemoryReadRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "MemoryReadRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .standard(proto: "bytes_count"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self.address)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.bytesCount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.address != 0 {
      try visitor.visitSingularUInt32Field(value: self.address, fieldNumber: 1)
    }
    if self.bytesCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.bytesCount, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: MemoryReadRequest, rhs: MemoryReadRequest) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.bytesCount != rhs.bytesCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension MemoryReadResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "MemoryReadResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .standard(proto: "read_bytes"),
    3: .standard(proto: "kernel_result"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self.address)
      case 2: try decoder.decodeSingularBytesField(value: &self.readBytes)
      case 3: try decoder.decodeSingularUInt32Field(value: &self.kernelResult)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.address != 0 {
      try visitor.visitSingularUInt32Field(value: self.address, fieldNumber: 1)
    }
    if !self.readBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.readBytes, fieldNumber: 2)
    }
    if self.kernelResult != 0 {
      try visitor.visitSingularUInt32Field(value: self.kernelResult, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: MemoryReadResponse, rhs: MemoryReadResponse) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.readBytes != rhs.readBytes {return false}
    if lhs.kernelResult != rhs.kernelResult {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
