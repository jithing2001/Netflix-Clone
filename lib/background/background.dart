import 'package:json_annotation/json_annotation.dart';
part 'background.g.dart';

@JsonSerializable()
class Background {
  List<Result>? results;

  Background({this.results});

  factory Background.fromJson(Map<String, dynamic> json) {
    return _$BackgroundFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BackgroundToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  Result({this.posterPath});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
