// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListResponse _$TaskListResponseFromJson(Map<String, dynamic> json) =>
    TaskListResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskListResponseToJson(TaskListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
