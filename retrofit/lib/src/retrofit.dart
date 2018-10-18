import 'package:retrofit/src/retrofit_rest_service.dart';
import 'package:http/http.dart' as http;

class Retrofit {
  final http.Client client;
  final String baseUrl;

  Retrofit(this.client, this.baseUrl);
}
