/* 5) Write a program to implement an enum called "Shapes” with the following elements.
SQUARE, CIRCLE, RECTANGLE, TRIANGLE, HEXAGON.
 Get the elements as list
 Access circle element directly
 Display the first element in enum
 Display index of triangle
 Get the first element with different way you use in point number 3
 Get the elements who have “AN” in their names
 Get the first element who have “T in their name”
 Get the elements that it’s length more than 6 and in starting from index 3 ( index 3
included )*/

import 'dart:io';

enum Shapes { SQUARE, CIRCLE, RECTANGLE, TRIANGLE, HEXAGON }

void main() {
  //Get the elements as a list
  List<Shapes> shapeList = Shapes.values; //.values for all elements of Shapes
  print('Elements as list: $shapeList');

  // Access the circle element directly
  Shapes circle = Shapes.CIRCLE; //for only CIRCLE
  print('Circle: $circle');

  // Display the first element in enum
  Shapes firstShape = shapeList.first; //returns the first element
  print('First element: $firstShape');

  // Display index of triangle
  int triangleIndex = shapeList.indexOf(Shapes
      .TRIANGLE); //take tow parameter firstly is Mandatory and scoend is option , Searches the list from index [start] to the end of the list.
  //datatype to triangleIndex is int beacuse Display index of triangle and index is integer number
  print('Index of triangle: $triangleIndex');

  // Get the first element with different way you use in point number 3
  Shapes firstShape1 = shapeList[0]; //element of index 0 is Shapes.SQUARE
  print('First element: $firstShape1');

  // Get the elements who have “AN” in their names
  List<Shapes> anShapes = shapeList
      .where((shape) => shape.toString().contains('AN'))
      .toList(); //where condation shape.toString().contains('AN'))
  print('Elements with "AN" in their names: $anShapes');

  //Get the first element who have “T in their name”
  Shapes tShape = shapeList.firstWhere((Element) => Element.toString().contains(
      'T')); //function firstWher search the first element accept the condition
  //contains() function if 'T' is exist then accept condition
  print('First element with "T" in its name: $tShape');
  

  //Get the elements that it’s length more than 6 and in starting from index 3 ( index 3
//included )
  List<Shapes> longShapes = shapeList
      .skip(3) //firstly 3 elements works to skip
      .where((shape) =>
          shape.toString().length >
          6) //where condation shape.toString().length > 6
      .toList();
  print('Elements with length > 6 starting from index 3: $longShapes');
}
