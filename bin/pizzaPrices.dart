// void main(){
//     const pizzaPrices = {
//  'margherita': 5.5,
//  'pepperoni': 7.5,
//  'vegetarian': 6.5,
// };
// const order = ['margherita', 'pepperoni'];
//   dynamic total=0;
//   order.forEach((x){
//     total=total+pizzaPrices[x];
//   });
//   print("total : \$"+total.toString());
// }
import 'dart:io';

void main() {
  // stdout.write("enter the number Of count : ");
  // int numberOfcount = int.parse(stdin.readLineSync()!);
  // for (int i = 0; i < numberOfcount; i++) {
  //   stdout.write("enter the number");

  //   int number = int.parse(stdin.readLineSync()!);
  //   int sum = 0;
  //   for (int j = 0; j <= number; j++) {
  //     sum = sum + j;
  //   }
  //   print("the sum is $sum");
  // }
  //////////
  //////////
  /////////
  ////////
  stdout.write("enter the number Of count : ");
  int numberOfcount = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (int i = 0; i < numberOfcount; i++) {
    stdout.write("enter the number : ");
    int number = int.parse(stdin.readLineSync()!);
    print("i is $i and sum $sum ");
    for (int j = number; j <= number; j = j + 1) {
      sum += j;
      print("i is $i and j is $j and sum $sum");
    }
  }
  print("the sum is : $sum");
}
