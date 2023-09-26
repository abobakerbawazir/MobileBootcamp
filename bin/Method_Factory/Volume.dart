//حجم
import 'coffee_vessel_factory.dart';

class Volume {
  late int quantity;
  late String unit;
  Volume(this.quantity, this.unit);
  @override
  String toString() {
    return super.toString() +
        "quantity : ${quantity.toString()} , unit : ${unit.toString()}";
  }
}
