//4) Write a program to create an enum called "DaysOfWeek" representing the days of the
//week using enum and display it
enum DaysOfWeek { str, sun, mon, tuse, wind, therse, fri }

void main() {
  print(DaysOfWeek.values.asNameMap().keys);
  //asNameMap() is function contains tow parameter and Creates a map from the names of enum)(DaysOfWeek) values to the values.
  //asNameMap().keys print key of map are (str, sun, mon, tuse, wind, therse, fri)
  
  //or slouton
  DaysOfWeek.values.asNameMap().keys.forEach((element) {
    print(element); 
  });
}
