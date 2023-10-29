//order 100 Product
// class Product {
//   int? id;
//   String? title;
//   String? description;
//   int? price;
//   double? discountPercentage;
//   double? rating;
//   int? stock;
//   String? brand;
//   String? category;
//   String? thumbnail;
//   List<String>? images;

//   Product(
//       {this.id,
//       this.title,
//       this.description,
//       this.price,
//       this.discountPercentage,
//       this.rating,
//       this.stock,
//       this.brand,
//       this.category,
//       this.thumbnail,
//       this.images});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     price = json['price'];
//     discountPercentage = json['discountPercentage'];
//     rating = json['rating'];
//     stock = json['stock'];
//     brand = json['brand'];
//     category = json['category'];
//     thumbnail = json['thumbnail'];
//     images = json['images'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['discountPercentage'] = this.discountPercentage;
//     data['rating'] = this.rating;
//     data['stock'] = this.stock;
//     data['brand'] = this.brand;
//     data['category'] = this.category;
//     data['thumbnail'] = this.thumbnail;
//     data['images'] = this.images;
//     return data;
//   }
// }
///////////////////////////////
// class Product100 {
//   List<Products1>? products;
//   int? total;
//   int? skip;
//   int? limit;

//   Product100({this.products, this.total, this.skip, this.limit});

//   Product100.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = <Products1>[];
//       json['products'].forEach((v) {
//         products!.add(new Products1.fromJson(v));
//       });
//     }
//     total = json['total'];
//     skip = json['skip'];
//     limit = json['limit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     data['total'] = this.total;
//     data['skip'] = this.skip;
//     data['limit'] = this.limit;
//     return data;
//   }
// }

// class Products1 {
//   int? id;
//   String? title;
//   String? description;
//   int? price;
//   double? discountPercentage;
//   double? rating;
//   int? stock;
//   String? brand;
//   String? category;
//   String? thumbnail;
//   List<String>? images;

//   Products1(
//       {this.id,
//       this.title,
//       this.description,
//       this.price,
//       this.discountPercentage,
//       this.rating,
//       this.stock,
//       this.brand,
//       this.category,
//       this.thumbnail,
//       this.images});

//   Products1.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     price = json['price'];
//     discountPercentage = json['discountPercentage'];
//     rating = json['rating'];
//     stock = json['stock'];
//     brand = json['brand'];
//     category = json['category'];
//     thumbnail = json['thumbnail'];
//     images = json['images'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['discountPercentage'] = this.discountPercentage;
//     data['rating'] = this.rating;
//     data['stock'] = this.stock;
//     data['brand'] = this.brand;
//     data['category'] = this.category;
//     data['thumbnail'] = this.thumbnail;
//     data['images'] = this.images;
//     return data;
//   }
// }

////////

// class Order {
//   List<Carts>? carts;
//   int? total;
//   int? skip;
//   int? limit;

//   Order({this.carts, this.total, this.skip, this.limit});

//   Order.fromJson(Map<String, dynamic> json) {
//     if (json['carts'] != null) {
//       carts = <Carts>[];
//       json['carts'].forEach((v) {
//         carts!.add(new Carts.fromJson(v));
//       });
//     }
//     total = json['total'];
//     skip = json['skip'];
//     limit = json['limit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.carts != null) {
//       data['carts'] = this.carts!.map((v) => v.toJson()).toList();
//     }
//     data['total'] = this.total;
//     data['skip'] = this.skip;
//     data['limit'] = this.limit;
//     return data;
//   }
// }

// class Carts {
//   int? id;
//   List<Products>? products;
//   int? total;
//   int? discountedTotal;
//   int? userId;
//   int? totalProducts;
//   int? totalQuantity;

//   Carts(
//       {this.id,
//       this.products,
//       this.total,
//       this.discountedTotal,
//       this.userId,
//       this.totalProducts,
//       this.totalQuantity});

//   Carts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//     total = json['total'];
//     discountedTotal = json['discountedTotal'];
//     userId = json['userId'];
//     totalProducts = json['totalProducts'];
//     totalQuantity = json['totalQuantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     data['total'] = this.total;
//     data['discountedTotal'] = this.discountedTotal;
//     data['userId'] = this.userId;
//     data['totalProducts'] = this.totalProducts;
//     data['totalQuantity'] = this.totalQuantity;
//     return data;
//   }
// }

// class Products {
//   int? id;
//   String? title;
//   int? price;
//   int? quantity;
//   int? total;
//   double? discountPercentage;
//   int? discountedPrice;
//   String? thumbnail;

//   Products(
//       {this.id,
//       this.title,
//       this.price,
//       this.quantity,
//       this.total,
//       this.discountPercentage,
//       this.discountedPrice,
//       this.thumbnail});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     quantity = json['quantity'];
//     total = json['total'];
//     discountPercentage = json['discountPercentage'];
//     discountedPrice = json['discountedPrice'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['quantity'] = this.quantity;
//     data['total'] = this.total;
//     data['discountPercentage'] = this.discountPercentage;
//     data['discountedPrice'] = this.discountedPrice;
//     data['thumbnail'] = this.thumbnail;
//     return data;
//   }
// }

class Order {
  int? id;
  List<Products>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Order(
      {this.id,
      this.products,
      this.total,
      this.discountedTotal,
      this.userId,
      this.totalProducts,
      this.totalQuantity});

  Order.fromJson(Map<String, dynamic> json) {
    //print(json);
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['discountedTotal'] = this.discountedTotal;
    data['userId'] = this.userId;
    data['totalProducts'] = this.totalProducts;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;
  String? thumbnail;

  Products(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedPrice,
      this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedPrice = json['discountedPrice'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedPrice'] = this.discountedPrice;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
