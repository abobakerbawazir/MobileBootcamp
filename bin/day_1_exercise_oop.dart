import 'dart:io';
//1) Write class 'Rectangle' that has properties for length and width. Implement methods to
//calculate the rectangle's area and perimeter. ( with implementation in main )

class Rectangle {
  late double length;
  late double width;

  Rectangle(double l, double w) {
    length = l;
    width = w;
  }

  showproductInfo() {
    print("");
  }

  calculteareaofRectangle() {
    print("the area of rectangle = ${length * width}");
  }

  calculteperimeterofRectangle() {
    print("the perimeter of rectangle = ${2 * (length + width)}");
  }
}

void main(List<String> args) {
  Rectangle r = Rectangle(3,5);

  r.calculteareaofRectangle();
  r.calculteperimeterofRectangle();
}
