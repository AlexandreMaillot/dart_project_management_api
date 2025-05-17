// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String?,
      htmlUrl: json['htmlUrl'] as String?,
      title: json['title'] as String?,
      parentId: json['parentId'] as String?,
      dartboard: json['dartboard'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      assignees: (json['assignees'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assignee: json['assignee'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      priority: json['priority'] as String?,
      startAt: Task._dateFromString(json['startAt'] as String?),
      dueAt: Task._dateFromString(json['dueAt'] as String?),
      size: json['size'] as String?,
      timeTracking: json['timeTracking'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'htmlUrl': instance.htmlUrl,
      'title': instance.title,
      'parentId': instance.parentId,
      'dartboard': instance.dartboard,
      'type': instance.type,
      'status': instance.status,
      'description': instance.description,
      'assignees': instance.assignees,
      'assignee': instance.assignee,
      'tags': instance.tags,
      'priority': instance.priority,
      'startAt': Task._dateToString(instance.startAt),
      'dueAt': Task._dateToString(instance.dueAt),
      'size': instance.size,
      'timeTracking': instance.timeTracking,
    };
