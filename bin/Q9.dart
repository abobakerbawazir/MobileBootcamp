void main(){
  //- 9-Write a program to display the first and last colors from the following list.
//color_list = ["Red","Green","White" ,"Black"]
  List<dynamic> color_list = ["Red", "Green", "White", "Black"];
  print(color_list.first);
  print(color_list.last);
  //or
  print(color_list[0]);
  print(color_list[color_list.length - 1]);
}