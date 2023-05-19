// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchJson _$SearchJsonFromJson(Map<String, dynamic> json) => SearchJson(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchJsonToJson(SearchJson instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      posterPath: json['poster_path'] as String?,
      backdrop_path: json['backdrop_path'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdrop_path,
      'title': instance.title,
    };
