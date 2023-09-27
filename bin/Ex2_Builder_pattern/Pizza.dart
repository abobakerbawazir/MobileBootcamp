import 'dart:io';

enum Volume { M, S, L }

class Pizza {
  late String size = Volume.L.name;
  late Set<String> _toppings;
  Pizza({
    required this.size,
  }) {
    if (this.size == Volume.L.name ||
        this.size == Volume.M.name ||
        this.size == Volume.S.name) {
      this.size = size;
    } else {
      print("size != value of enum");
    }
  }
  set Toppings(Set<String> toppings) {
    this._toppings = toppings;
  }

  Set<String> get Toppings {
    return this._toppings;
  }

  // toppingPrint() {
  //   var x = Toppings;
  //   x.forEach(
  //     (element) {
  //       stdout.write("${element} ,");
  //     },
  //   );
  // }

  @override
  String toString() {
    if (Toppings.length == 1) {
      print("A delicous ${size} " +
"pizza covered in ${Toppings.first} and cheese.");
    } else {
      print("A delicous ${size} pizza covered in ${Toppings}, and cheese");
    }

    return super.toString();
  }
}
