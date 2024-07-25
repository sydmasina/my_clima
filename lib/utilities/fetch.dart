import 'package:http/http.dart' as http;
import 'dart:convert';

Future getData(String uri) async {
  try {
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Stream.error('Something went wrong when fetching data.');
    }
  } catch (e) {
    print(e);
  }
}
