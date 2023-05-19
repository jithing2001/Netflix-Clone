// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tense_drama.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenseDrama _$TenseDramaFromJson(Map<String, dynamic> json) => TenseDrama(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TenseDramaToJson(TenseDrama instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'overview': instance.overview,
    };
