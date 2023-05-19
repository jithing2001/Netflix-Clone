// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Top10 _$Top10FromJson(Map<String, dynamic> json) => Top10(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Top10ToJson(Top10 instance) => <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
    };
