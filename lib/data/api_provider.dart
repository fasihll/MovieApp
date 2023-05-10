import 'dart:convert';
import 'package:http/http.dart';
import 'package:acara35/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '0fc5740199faa752da813c8c97f659e8';
  String baseurl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMoviews() async {
    Response response =
        await client.get('$baseurl/movie/popular?api_key=$apiKey');
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
