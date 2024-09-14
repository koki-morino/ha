import 'package:memkept/protos/todo.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

main() async {
  final url = Uri.parse('ws://localhost/ws');
  final channel = WebSocketChannel.connect(url);

  channel.stream.listen((message) {
    Todo todo = Todo.fromBuffer(message);
    print(todo);
  });

  // Wait for responses from a server.
  await Future.delayed(const Duration(milliseconds: 100));

  channel.sink.close(status.normalClosure);
}
