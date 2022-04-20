import 'dart:convert';

List<Product> ProductFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

class Product {
  Product({
    required this.id,
    required this.product_title,
    required this.product_price,
  });

  int id;
  String product_title;
  String product_price;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        product_title: json["product_title"],
        product_price: json["body"],
      );
}