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

  // Feed History
  static String feedHistoryMonthly(String? activationId) =>
      '$baseUrl/feedhistorys/month/$activationId';
  static String feedHistoryWeekly(String? activationId, month) =>
      '$baseUrl/feedhistorys/week/$activationId/$month';
  static String feedHistoryDaily(String? activationId, week) =>
      '$baseUrl/feedhistorys/day/$activationId/$week';
  static String feedHistory(String? activationId, date) =>
      '$baseUrl/feedhistorys/hour/$activationId/$date';

  // Fish Grading
  static String fishGrading(String? activation_id) =>
      '$baseUrl/fishgradings/activation/$activation_id';
}
