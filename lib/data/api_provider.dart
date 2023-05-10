import 'dart:convert';
import 'package:http/http.dart';
import 'package:acara35/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '15fbee62244aef97c54483a9173ad714';
  String baseurl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMoviews() async {
    Response response =
        await client.get(Uri.parse('$baseurl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
