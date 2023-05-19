import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/south_indian/south_indian.dart';

Future<List<Result>> getImageSouth() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200&api_key=9e9f951895df54111b26261f2aff0bd7'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = SouthIndian.fromJson(jsondata);

    if (result.results != null) {
      return result.results!;
    }
  } else {
    log('oops');
  }
  List<Result> empty = [];
  return empty;
}
