import 'SwitchManager.dart';
import 'SwitchOff.dart';
import 'SwitchOn.dart';

void main(List<String> args) {
  SwitchOff switchOff = SwitchOff();
  SwitchOn switchOn = SwitchOn();
  SwitchManager switchManager = SwitchManager(connectionState: switchOff);
  //switchOff.connect();
  switchManager.startConnection();
  print("");
  switchManager.setState(switchOn);
  //switchOff.connect();
  switchManager.startConnection();
}
