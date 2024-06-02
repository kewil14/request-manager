class ApiConstants {
  static const String appName = 'Request Manager';

  // URL de base de l'API
  // static const String baseUrl = 'https://exempleapi.com/api';
  // static const String baseUrl = 'http://localhost:9000/api';
  static const String baseUrl = 'http://165.227.34.208:9000/api';

  // Points de terminaison spécifiques
  static const String loginEndpoint = '/login';
  static const String registerEndpoint = '/user/register';
  static const String fetchUserProfile = '/user/profile';

  // Clés d'API
  static const String apiKey = 'VOTRE_CLE_API_ICI';

  // Autres constantes comme les headers spécifiques à l'API si nécessaire
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
}
