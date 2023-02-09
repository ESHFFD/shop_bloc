// ignore_for_file: public_member_api_docs, sort_constructors_first

class Product {
  final int id;
  final String name;
  final double price;
  final double off;
  final String note;
  final String picUrl;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.off,
    required this.note,
    required this.picUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'off': off,
      'note': note,
      'picUrl': picUrl,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'] as double,
      off: json['off'] as double,
      note: json['note'],
      picUrl: json['picUrl'],
    );
  }
}
