import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;

class NewsApiProvider {
  final _apiKey = '0f320ceeb51d20e6d458a5a9288bb026';
  Client client = Client();

  Future<dynamic> fetchMovieList(dynamic search) async {
    var data = search == "" ? "example" : search;
    final response = await client.get(
      Uri.parse("https://gnews.io/api/v4/search?q=$data&token=$_apiKey"),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load post');
    }
  }
}
