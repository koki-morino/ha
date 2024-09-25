part of 'websocket_bloc.dart';

sealed class WebsocketEvent {
  const WebsocketEvent();
}

final class WebsocketConnected extends WebsocketEvent {
  const WebsocketConnected();
}

final class WebsocketDisconnected extends WebsocketEvent {
  const WebsocketDisconnected();
}
