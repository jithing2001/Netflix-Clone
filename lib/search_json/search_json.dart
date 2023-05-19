import 'package:json_annotation/json_annotation.dart';
part 'search_json.g.dart';

@JsonSerializable()
class SearchJson {
  List<Result>? results;

  SearchJson({this.results});

  factory SearchJson.fromJson(Map<String, dynamic> json) {
    return _$SearchJsonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchJsonToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdrop_path;
  @JsonKey(name: 'title')
  String? title;

  Result({this.posterPath,this.backdrop_path,this.title});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
