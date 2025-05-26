
class AddToCartModel {
  final String id;
  final String productId;
  final String name;
  final String category;
  final String imageUrl;
  final String price; 
  final String quantity;

  AddToCartModel({required this.id, required this.productId, required this.name, required this.category, required this.imageUrl, required this.price, required this.quantity}); 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map,String documentId) {
    return AddToCartModel(
      id: documentId,
      productId: map['productId'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as String,
    );
  }


}
