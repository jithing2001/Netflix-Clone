import 'package:json_annotation/json_annotation.dart';
part 'south_indian.g.dart';

@JsonSerializable()
class SouthIndian {
  List<Result>? results;

  SouthIndian({this.results});

  factory SouthIndian.fromJson(Map<String, dynamic> json) {
    return _$SouthIndianFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SouthIndianToJson(this);
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
