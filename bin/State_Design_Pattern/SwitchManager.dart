import 'ConnectionState.dart';


class SwitchManager {
  late ConnectionState connectionState;
  SwitchManager({required this.connectionState});
  setState(ConnectionState state) {
    connectionState = state;
  }

  startConnection() {
    connectionState.connect();
  }
}
