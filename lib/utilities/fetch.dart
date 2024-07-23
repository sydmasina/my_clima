import 'package:http/http.dart' as http;

Future getData(String uri) async {
  try {
    var response = await http.get(Uri.parse(uri));
    return response.body;
  } catch (e) {
    print(e);
  }
}
