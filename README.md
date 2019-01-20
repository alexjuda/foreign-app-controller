# foreign-app-controller
Read / write another process memory, simulate keystrokes

## Generating API gRPC

```
cd ForeignAppController/Services/Protos
protoc API.proto --swift_out="../Generated" --swiftgrpc_out="../Generated"
```
