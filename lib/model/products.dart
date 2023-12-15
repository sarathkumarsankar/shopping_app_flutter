
class Product {
  String id;
  String title;
  double price;
  String imageUrl;
  String company;
  List<int> sizes;
  ProductCategory category;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.company,
      required this.sizes,
      required this.category});
}

class CartItem {
  String id;
  String title;
  double price;
  String imageUrl;
  String company;
  int size;
  ProductCategory category;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.company,
      required this.size,
      required this.category});
}

enum ProductCategory {
  all,
  adidas,
  nike,
  bata,
  reebok,
  puma,
  underArmour,
  vans,
  converse,
  newBalance
}

