import 'dart:io';

import 'coffee_vessel_factory.dart';

void main(List<String> args) {
  print("1.rested\n2.sleepy\n3.barelyAlive");
  stdout.write("What is your status ? ");
  var input = int.parse(stdin.readLineSync()!);
  if (input == 1) {
    print(personStatus.values[input - 1].name );
    CoffeeVesselFactory c = CoffeeVesselFactory.makeObject(personStatus.rested);

    print(c.toString());
    c.toString();
  } else if (input == 2) {
    print(personStatus.values[input - 1].name);

    CoffeeVesselFactory c = CoffeeVesselFactory.makeObject(personStatus.sleepy);
    print(personStatus.values[1].name);
    print(c.toString());
    c.toString();
    
  } else if (input == 3) {
    print(personStatus.values[input - 1].name);
    CoffeeVesselFactory c =
        CoffeeVesselFactory.makeObject(personStatus.barelyAlive);

    c.toString();
    print(c.toString());
  } else {
    print("invalid input");
  }
}
