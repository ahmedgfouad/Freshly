class FirestorePath {
  static String products() => "products/";
  static String categories() => "categories/";
  static String user(String uid) => "users/$uid";

  static String carts(String uid, String cartId) => "users/$uid/cards/$cartId";
  static String myProductsCart(String uid) => "users/$uid/cards/";

  static String favorites(String uid, String favoriteId) =>
      "users/$uid/favorite/$favoriteId";
  static String myProductsFavorite(String uid) => "users/$uid/favorite/";

  static String addresses(String uid, String addressId) =>
      "users/$uid/addresses/$addressId";
  static String myAddresses(String uid) => "users/$uid/addresses/";
}
