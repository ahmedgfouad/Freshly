class ApiPath {
  static String products() => "products/";
  static String categories() => "categories/";
  static String user(String uid) => "users/$uid";

  static String addToCart(String uid, String cartId) =>
      "users/$uid/cards/$cartId";
  static String myProductsCart(String uid) =>
      "users/$uid/cards/";

       static String addToFavorite(String uid, String favoriteId) =>
      "users/$uid/favorite/$favoriteId";
       static String myProductsFavorite(String uid) =>
      "users/$uid/favorite/";
}
