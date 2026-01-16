class ApiConstants {
  ApiConstants._();

  // Network Settings
  static const String baseUrl = 'https://dushkaburger.com/wp-json/';
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String authorizationHeader = 'Authorization';
  
  // Auth - Basic Auth (Base64 of testapp:5S0Q YjyH 4s3G elpe 5F8v u8as)
  // You can compute this dynamically in your DioInterceptor
  static const String basicAuthCredentials = 'Basic dGVzdGFwcDo1UzBRIFlqeUggNHMzRyBlbHBlIDVGOHYgdThhcw==';

  // Guest Auth
  static const String getGuestId = 'guestcart/v1/guestid';

  // Categories & Products
  static const String categories = 'custom-api/v1/categories';
  static const String productDetails = 'custom-api/v1/products'; // Use query param ?product_id=
  static const String productAddons = 'proaddon/v1/get2/';      // Use query param ?product_id2=

  // Cart (Guest Flow)
  static const String guestCart = 'guestcart/v1/cart'; // GET (with ?guest_id=), POST, and DELETE

  // Storage Keys
  static const String guestIdKey = 'cached_guest_id';
  static const String tokenKey = 'token';
}