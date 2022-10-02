class Urls {
  // static final String baseUrl = 'http://jft.web.id/fishapi/api';
  static final String baseUrl = 'http://10.0.2.2:5000/api';

  // Home
  static final String statistic = '$baseUrl/statistic';

  // Pond
  static final String ponds = '$baseUrl/ponds';
  static String pond(String? pondId) => '$baseUrl/ponds/$pondId';

  // Activation
  static String activation(String? pondId) => '$baseUrl/ponds/status/$pondId';
}
