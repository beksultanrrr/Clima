import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkingHelper {
  NetworkingHelper({required this.Url});
  final String Url;

  Future  getData() async {
    http.Response response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      String data = response.body;
      // print(response.body);
      // var longitude = jsonDecode(data)['coord']['lon'];
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
