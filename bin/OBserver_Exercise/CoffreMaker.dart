import 'dart:io';

import 'OBServerCoffeeDrinker.dart';

//class Probider or subject
class CoffreMaker {
  List<OBServerCoffeeDrinker> observers = [];
  void addOBserver({required OBServerCoffeeDrinker obServer}) {
    observers.add(obServer);
  }

  void removeOBserver({required OBServerCoffeeDrinker obServer}) {
    observers.remove(obServer);
  }

  void notifyObservers({required String message}) {
    DateTime timestamp = DateTime.now();
    for (OBServerCoffeeDrinker obServer in observers) {
      obServer.notify(timestamp: timestamp);
    }
  }

  void prepareCoffee() {
    print("preparing the coffee...");
    sleep(Duration(seconds: 2));
    notifyObservers(message: "Coffee`s done!");
  }
}

