import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';

final log = Logger("main");
// TODO: Use environment variable.
final uri = Uri.parse('ws://localhost:8000/ws');

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  Timer? timer;
  WebSocketChannel? channel;

  WebsocketBloc() : super(const WebsocketConnecting()) {
    on<WebsocketConnected>(_onConnected);
    on<WebsocketDisconnected>(_onDisconnected);
  }

  @override
  Future<void> close() {
    timer?.cancel();
    channel?.sink.close(WebSocketStatus.normalClosure);
    return super.close();
  }

  void _onConnected(WebsocketConnected event, Emitter<WebsocketState> emit) {
    emit(const WebsocketAvailable());

    channel?.stream.listen((message) {
      log.fine("Received: $message");
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      log.fine("Pinging...");
      channel?.sink.add("Ping");
    });
  }

  void _onDisconnected(
      WebsocketDisconnected event, Emitter<WebsocketState> emit) async {
    emit(const WebsocketConnecting());

    log.fine("Connecting...");
    channel = WebSocketChannel.connect(uri);

    try {
      await channel?.ready;
      add(const WebsocketConnected());
    } catch (e) {
      log.severe(e);
      log.fine('Retrying in 5 seconds.');
      Timer(
        const Duration(seconds: 5),
        () => add(const WebsocketDisconnected()),
      );
    }
  }
}
