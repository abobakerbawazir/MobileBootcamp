import 'Vessel.dart';
import 'coffee_vessel_factory.dart';

class Bucket extends Vessel implements CoffeeVesselFactory{
  Bucket(super.volume, super.liquidType);
  @override
  String toString() {
    // TODO: implement toString
            return super.toString()+"";

  }
 
}