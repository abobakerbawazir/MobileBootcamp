import 'ConnectionState.dart';

class SwitchOff implements ConnectionState {
  @override
  connect() {
    print("he light switch is off.\nToggling the light switch...Touching \nthe Stateful...\nHandler of StatusOff is being called!\nThe light switch is on.");
  }
}
