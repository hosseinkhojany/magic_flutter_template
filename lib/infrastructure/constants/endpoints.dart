class EndPoints {

  static String BASE_URL_WC = 'https://rapexa.ir/wp-json/wc/v3';
  static String BASE_URL_WP = 'https://rapexa.ir/wp-json/wp/v2';
  static String BASE_URL_JWT = 'https://rapexa.ir/wp-json/jwt-auth/v1';
  static String BASE_DIGIT = 'https://rapexa.ir/wp-json/digits/v1';

  static String LOGIN = "$BASE_DIGIT/login_user";
  static String SEND_OTP = "$BASE_DIGIT/send_otp";
  static String CREATE_USER = "$BASE_DIGIT/create_user";
  static String RECOVERY = "$BASE_DIGIT/recovery";
  static String LOGOUT = "$BASE_DIGIT/logout";

  static String LIST_PRODUCT = "$BASE_URL_WC/products";
  static String LIST_POSTS = "$BASE_URL_WP/posts?_embed&per_page=100";
  static String GET_USER_DETAIL(String userId) => "$BASE_URL_WP/users/$userId";
  static String GET_ORDERS = "$BASE_URL_WP/orders";



}
