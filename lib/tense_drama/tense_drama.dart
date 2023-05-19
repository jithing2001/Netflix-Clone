import 'package:json_annotation/json_annotation.dart';
part 'tense_drama.g.dart';

@JsonSerializable()
class TenseDrama {
  int? page;
  List<Result>? results;

  TenseDrama({this.page, this.results});

  factory TenseDrama.fromJson(Map<String, dynamic> json) {
    return _$TenseDramaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TenseDramaToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'overview')
  String? overview;

  Result({this.posterPath, this.backdropPath, this.title, this.overview});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
