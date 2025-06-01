class SaveProductModel {
  final String id;
  final String productId;
  final String name;
  final String category;
  final String imageUrl;
  final String price;
  final String quantity;
  final String totalPrice;

  SaveProductModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }

  factory SaveProductModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return SaveProductModel(
      id: documentId,
      productId: map['productId'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as String,
      totalPrice: map['totalPrice'] as String,
    );
  }
}
