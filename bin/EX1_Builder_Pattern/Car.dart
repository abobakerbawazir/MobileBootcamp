enum CarType { CITY_CAR, SPORTS_CAR }

enum Category { MANUAL, AUTOMATIC }

class Car {
  late CarType cartype;
  late Category _category;
  late int seats;
  late bool _gpsNavigator;
  Car({required this.cartype, required this.seats});

  set Categorys(Category category) {
    this._category = category;
  }

  Category get Categorys {
    return this._category;
  }

  set GpsNavigator(bool gpsNavigator) {
    this._gpsNavigator = gpsNavigator;
  }

  bool get GpsNavigator {
    return this._gpsNavigator;
  }

  
  PrinttoString() {
    /* Car Type: SPORTS_CAR
Car Category: MANUAL
Seats Count: 4
GPS Navigator: Functional */
    print("Car Type: ${cartype.name}");
    print("Car Category: ${Categorys.name}");
    print("Seats Count: ${seats}");
    if (GpsNavigator == true) {
      print("GPS Navigator: Functional");
    }
    else if(GpsNavigator==false){
      print("GPS Navigator: : N/A");
    }
    
  }
}
