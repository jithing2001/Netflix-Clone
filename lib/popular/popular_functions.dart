import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/popular/popular.dart';

Future<List<Result>> getImagesPopular() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=9e9f951895df54111b26261f2aff0bd7'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = Popular.fromJson(jsondata);

    if (result.results != null) {
      return result.results!;
    }
  } else {
    print('oopss');
  }
  List<Result> empty = [];
  return empty;
}
