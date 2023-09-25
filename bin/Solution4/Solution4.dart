/*1- We applied principle Single responsiple Each method has only one action 
2- We applied principle Liskov substitution all Any Super class Message of method, then used method of Super on  Conncrete class
3- We applied principle Dependency inversion class ShopCart cerate Object from class Item*/


class Item {
  final int code;
  final double price;
  final double quantity;

  Item(this.code, this.price, this.quantity);

  static List<Item> stockItems = [
    Item(123, 20.0, 5),
    Item(111, 10.5, 1),
    Item(222, 50.0, 10),
  ];
}

class ShoppingCart {
  List<Item> cartItems = [];

  void removeFromCart(Item item) {
    if (cartItems.contains(item)) {
      cartItems.remove(item);
    }
  }

  void addToCart(Item item) {
    var quantityInStock = Item.stockItems
        .where((element) => element.code == item.code)
        .first
        .quantity;
    if (quantityInStock > 0) {
      cartItems.add(item);
    }
  }

  int getCartItemsCount() {
    return cartItems.length;
  }

  claculatePrice() {
    double total = 0;
    cartItems.forEach((element) {
      //element.price;
      total += element.price;
    });
    return total;
    // for (var item in cartItems) {
    //   total += item.price;
    //   return total;
    // }
  }
}

class Invoice {
  double createInvoices(List<ShoppingCart> items) {
    double total = 0;
    for (var item in items) {
      total += item.claculatePrice();
      
    }return total;
    
  }

  // List<Item> invoices = [];
  // void createInvoice() {
  //   double total = 0;
  //   for (var item in invoices) {
  //     total += item.price;
  //   }
  // }

  printInvoice(String invoice) {
    print(invoice);
  }
}

class CustomerEmail {
  sendEmail(String customerEmail) {
    //Send Email to Customer
  }
}

void main(List<String> args) {
  List<ShoppingCart> x = [];
  List<ShoppingCart> x1 = [];
  // Item item1 = Item(123, 50, 1);
  // Item item2 = Item(111, 60, 2);
  //  x.add(item1);
  //  x.add(item2);
  // Item item3 = Item(125, 70, 3);
  // Item item4 = Item(126, 80, 4);
  ShoppingCart s = ShoppingCart();
  s.addToCart(Item(123, 50, 1));
  s.addToCart(Item(111, 60, 2));
  ShoppingCart s1 = ShoppingCart();
  s1.addToCart(Item(123, 50, 1));
  s1.addToCart(Item(111, 600, 2));

  print(s.getCartItemsCount());
  s.claculatePrice();
  s1.claculatePrice();

  //print(x);
  Invoice i = Invoice();
  x.add(s);
  x1.add(s1);
  i.createInvoices(x);
  i.printInvoice("invoice 1 : ${i.createInvoices(x)}");
  i.createInvoices(x1);
  i.printInvoice("invoice 2 : ${i.createInvoices(x1)}");
}
