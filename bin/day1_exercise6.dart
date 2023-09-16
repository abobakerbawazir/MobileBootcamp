//6) Write class called 'ShoppingCart' with properties like 'items' and 'total'. Implement
//methods to add items to the cart and calculate the total cost
import 'dart:io';

class Book {
  late int id;
  late String name;
  late String author;
  late List<String> category;
  late double price;
  late int quantity;
  Book(int ID, String Name, String Author, List<String> Category, double Price,
      int Quantity) {
    //print("the deafult constrctor");
    id = ID;
    name = Name;
    author = Author;
    category = Category;
    price = Price;
    quantity = Quantity;
  }
}

class ShoppingCart {
  List<Book> items = [];
  double total = 0;

  additems(Book book) {
    items.add(book);

    // total += total;
    // for (var i in items) {
    //   print(i.id);
    //   print(i.name);
    //   print(i.author);
    //   print(i.category);
    //   print(i.price);
    //   print(i.quantity);
    //   print('');
    // }
    //print(items);
  }

  printitems() {
    for (var i in items) {
      print(i.id);
      print(i.name);
      print(i.author);
      print(i.category);
      print(i.price);
      print(i.quantity);
      print('');
      total = total + i.price;
    }
    print("the total cost of books = $total");
  }
}

void main(List<String> args) {
  Book b = Book(450, "Book 1", "Mike X", ["Science", "Development"], 30.5, 2);
  Book b1 = Book(451, "Book 2", "Jad Y", ["Horror", "Crime"], 47.5, 0);
  Book b2 = Book(452, "Book 3", "Michel Z", ["Horror", "Comic"], 17, 4);
  ShoppingCart shopcart = ShoppingCart();
  shopcart.additems(b);
  shopcart.additems(b1);
  shopcart.additems(b2);
  shopcart.printitems();
  //print(shopcart);
  //print(b);
}
