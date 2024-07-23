import 'package:http/http.dart' as http;

Future getData(String uri) async {
  try {
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Stream.error('Something went wrong when fetching data.');
    }
  } catch (e) {
    print(e);
  }
}
