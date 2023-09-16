//2) Write class called 'Vehicle' with properties like 'brand', 'model', and 'year'. Implement a
//method to display the vehicle details. ( with implementation in main )
class Vehicle {
  late String brand;
  late String model;
  late int year;

  Vehicle(String b, String m, int y) {
    brand = b;
    model = m;
    year = y;
  }

  showproductInfo() {
    print(
        "the details of Vehicle are brand is $brand and model is $model and yaer $year");
  }
}

void main(List<String> args) {
  Vehicle v = Vehicle("Toyota ", "corolaa", 2008);
  v.showproductInfo();
}
