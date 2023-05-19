import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';

@JsonSerializable()
class Trending {
  List<Result>? results;

  Trending({this.results});

  factory Trending.fromJson(Map<String, dynamic> json) {
    return _$TrendingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? release_date;
  @JsonKey(name: 'backdrop_path')
  String? backdrop_path;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'overview')
  String? overview;

  Result({this.posterPath});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
