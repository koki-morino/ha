import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

main() async {
  final url = Uri.parse('ws://localhost:8080');
  final channel = WebSocketChannel.connect(url);

  channel.stream.listen((message) {
    print('Received: $message');
  });

  for (var i = 0; i < 5; i++) {
    channel.sink.add('Sequence $i');
  }

  // Wait for responses from a server.
  await Future.delayed(const Duration(milliseconds: 100));

  channel.sink.close(status.normalClosure);
}
