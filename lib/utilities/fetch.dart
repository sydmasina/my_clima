import 'package:http/http.dart' as http;

Future<http.Response> getData(String uri) {
  return http.get(Uri.parse(uri));
}
