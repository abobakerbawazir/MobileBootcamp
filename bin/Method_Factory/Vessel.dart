import 'Volume.dart';
import 'coffee_vessel_factory.dart';

//Vessel وعاء
class Vessel {
  late Volume volume;
  late String liquidType;
  Vessel(this.volume, this.liquidType);
  @override
  String toString() {
    // TODO: implement toString
    return "person NEEDS a ${volume.quantity} ${volume.unit}, full of ${liquidType}";
  }
}
