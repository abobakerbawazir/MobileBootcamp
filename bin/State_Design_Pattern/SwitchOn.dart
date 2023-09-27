import 'ConnectionState.dart';

class SwitchOn implements ConnectionState {
  @override
  connect() {
    print("The light switch is on.\nToggling the light switch...\nTouching the Stateful...\nHandler of StatusOn is being called!\nThe light switch is off.");
  }
}
