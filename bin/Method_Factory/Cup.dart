import 'Vessel.dart';
import 'coffee_vessel_factory.dart';

class Cup extends Vessel implements CoffeeVesselFactory{
  Cup(super.volume, super.liquidType);
  @override
  String toString() {
    
    return super.toString()+"";
  }
}