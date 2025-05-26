class ApiPath {
  static String products() => "products/";
  static String categories() => "categories/";
  static String user(String uid) => "users/$uid";

  static String addToCart(String uid, String cartId) =>
      "users/$uid/cards/$cartId";
}
