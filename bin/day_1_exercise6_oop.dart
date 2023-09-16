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
    id = ID;
    name = Name;
    author = Author;
    category = Category;
    price = Price;
    quantity = Quantity;
  }
}

class ShopCart {
  List<Book> items = [];
  double total = 0;

  additems(int id, String name, String Author, List<String> Category,
      double Price, int Quantity) {
    items.add(Book(id, name, Author, Category, Price, Quantity));

    for (var i in items) {
      print(
          "${i.id} \n${i.name} \n${i.author} \n${i.category} \n${i.price} \n${i.quantity}");
    }
  }

  totalcost(int id, String name, String Author, List<String> Category,
      double Price, int Quantity) {
    for (var x in items) {
      print("the price of  ${x.name} = ${x.price}");
    }
  }
}

void main(List<String> args) {
  //Book b = Book(451, "Book 3", "Michel Z", ["Horror", "Comic"], 17, 4);
  //Book b1 = Book(2, "Book 3", "Michel Z", ["Horror", "Comic"], 17, 4);
  ShopCart Shop = ShopCart();
  Shop.additems(3, "Book 3", "Michel Z", ["Horror", "Comic"], 17, 4);
  Shop.totalcost(3, "Book 3", "Michel Z", ["Horror", "Comic"], 17, 4);
}
