// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocListResponse _$DocListResponseFromJson(Map<String, dynamic> json) =>
    DocListResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Doc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocListResponseToJson(DocListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
