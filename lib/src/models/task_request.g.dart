// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRequest _$TaskRequestFromJson(Map<String, dynamic> json) => TaskRequest(
      dartboard: json['dartboard'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      parentId: json['parentId'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      assignees: (json['assignees'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assignee: json['assignee'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      priority: json['priority'] as String?,
      startAt: json['startAt'] as String?,
      dueAt: json['dueAt'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$TaskRequestToJson(TaskRequest instance) =>
    <String, dynamic>{
      'dartboard': instance.dartboard,
      'title': instance.title,
      'description': instance.description,
      'parentId': instance.parentId,
      'type': instance.type,
      'status': instance.status,
      'assignees': instance.assignees,
      'assignee': instance.assignee,
      'tags': instance.tags,
      'priority': instance.priority,
      'startAt': instance.startAt,
      'dueAt': instance.dueAt,
      'size': instance.size,
    };
