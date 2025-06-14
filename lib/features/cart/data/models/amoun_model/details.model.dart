class DetailsAmountModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsAmountModel({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsAmountModel.fromJson(Map<String, dynamic> json) =>
      DetailsAmountModel(
        subtotal: json['subtotal'] as String?,
        shipping: json['shipping'] as String?,
        shippingDiscount: json['shipping_discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
