Compile proto for Go.
protoc --proto_path=. --go_out=../srv/pkg/ crud.proto todo.proto todos.proto

Compile proto for Dart.
protoc --proto_path=. --dart_out=../app/lib/protos/ crud.proto todo.proto todos.proto

Dart also needs to compile third-party proto (e.g. google/protobuf/empty.proto) when using it.
