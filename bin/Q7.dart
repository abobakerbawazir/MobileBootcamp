//7) Write a program to read the first 3 lines of a file
import 'dart:io';

void main() {
  File f = new File(
      "fileQ7.txt"); //to use class File from dart.io to handle file fileQ7.txt and object f
  try {
    List<String> lines = f
        .readAsLinesSync(); //readAsLinesSync() it method to read all the lines of the file into list of string
    if (lines.length >= 3) {
      print(lines[0]); //print line 1
      print(lines[1]); //print line 2
      print(lines[2]); //print line 3
    } else {
      print("the file is not contain 3 lines of a file fileQ7.txt");//print message if not lines.length >= 3
    }
  } catch (e) {
    print("can not read the file fileQ7.txt :$e");//print message exception 
  }
  /*f.readAsString().then((value) {
    print(value);
  });*/
}
