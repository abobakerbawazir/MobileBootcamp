//12 - Write a program to concatenate all elements in a list into a string and return
//it
void main() {
  List<dynamic> mylist = ["Abobaker", " ", "Saeed", " ", "Bawazir"];
  String result = concatenateallelements(mylist);
  print(result);
}

String concatenateallelements(List<dynamic> lst) {
  String concatenate = lst.join();
  return concatenate;
}
