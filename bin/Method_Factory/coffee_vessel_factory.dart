import 'dart:io';

import 'Bucket.dart';
import 'Cup.dart';
import 'Vessel.dart';
import 'Volume.dart';

enum personStatus { rested, sleepy, barelyAlive }

abstract class CoffeeVesselFactory {
  factory CoffeeVesselFactory.makeObject(personStatus status) {
    switch (status) {
      case personStatus.rested:
        Volume volume = Volume(1, "cup");
        return Bucket(volume, "Coffie");

      case personStatus.sleepy:
        Volume volume = Volume(2, "Bucket");
        return Cup(volume, "Coffie");
      case personStatus.barelyAlive:
        Volume volume = Volume(2, "Liters");
        return Cup(volume, "Coffie");
      default:
        return throw UnimplementedError();
    }
    
  }
  
}
