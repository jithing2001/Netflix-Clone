import 'package:json_annotation/json_annotation.dart';

part 'top10.g.dart';

@JsonSerializable()
class Top10 {
  List<Result>? results;

  Top10({this.results});

  factory Top10.fromJson(Map<String, dynamic> json) => _$Top10FromJson(json);

  Map<String, dynamic> toJson() => _$Top10ToJson(this);
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
