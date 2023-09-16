import 'dart:io';

class product {
  late double price;
  late String name;
  late String decription;
  late Category cat;

  product(double p, String n, String d, Category s) {
    //int x =

    //price = double.parse(stdin.readLineSync()!);
    //stdout.write("enter name : ");
    //name = stdin.readLineSync()!;
    price = p;
    name = n;
    decription = d;
    cat = s;
  }
  showproductInfo() {
    print("the price of name $name is $price and description is $decription");
  }

  updateproductprice(double newprice) {
    price = newprice;
    print("the price of name $name is $price and description is $decription");
  }
}

class Category {
  late String categoryNmae;
  //Category() {}
  showcatogory() {}
}

void main(List<String> args) {
  List<String> names = new List.generate(7, (index) => "Abobakerv $index");

  print(names);
  //Category catone = Category();
  //catone.categoryNmae;

  // double x = double.parse(stdin.readLineSync()!);

  product p = product(3, 'orang', 'good for student', Category());
  //p.showproductInfo();
  p.updateproductprice(7);
  //print(p);
  //p.cat.categoryNmae;
  //p.updateproductprice(5);
  //p.cat.categoryNmae;

  print(p);
  // print(p);
}
// sum_x_y(int x, [int? y]) {
//   if (y == null)
//     y = 0;
//   else
//     ;

//   return x + y;
// }

// Function sum(int a, int b) => a + b;
// //void sum(int a, int b) {
// //  print(a + b);
// //}

// void main() {
//   //sum(3, 5);
//   int s = sum_x_y(3, 1);
//   print(s);
//   // int x = 3;
//   // int y = 5;
//   // print(x + y);
// }
