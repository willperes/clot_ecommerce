import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class WebClient {
  static const String baseURL = "http://192.168.0.119:3000/";

  http.Client client = InterceptedClient.build(
    interceptors: [],
    requestTimeout: const Duration(
      milliseconds: 5000,
    ),
  );
}
