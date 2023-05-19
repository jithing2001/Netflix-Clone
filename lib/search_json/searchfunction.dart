import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/search_json/search_json.dart';

Future<List<Result>> getImageSearch({required String result}) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=$result&api_key=9e9f951895df54111b26261f2aff0bd7'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = SearchJson.fromJson(jsondata);

    if (result.results != null) {
      return result.results!;
    }
  } else {
    log('oops');
  }
  List<Result> empty = [];
  return empty;
}

Future<List<Result>> getImageSearchEmpty() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=Spider&api_key=9e9f951895df54111b26261f2aff0bd7'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = SearchJson.fromJson(jsondata);

    if (result.results != null) {
      return result.results!;
    }
  } else {
    log('oops');
  }
  List<Result> empty = [];
  return empty;
}
