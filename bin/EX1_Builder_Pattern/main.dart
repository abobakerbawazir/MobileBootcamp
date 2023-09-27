import 'Car.dart';

void main(List<String> args) {
  Car cars = Car(cartype: CarType.SPORTS_CAR, seats: 4);
  cars.Categorys = Category.MANUAL;
  cars.GpsNavigator = true;
  cars.PrinttoString();
  print('');
  Car cars1 = Car(cartype: CarType.CITY_CAR, seats: 6);
  cars1.Categorys = Category.MANUAL;
  cars1.GpsNavigator = false;
  cars1.PrinttoString();
}
