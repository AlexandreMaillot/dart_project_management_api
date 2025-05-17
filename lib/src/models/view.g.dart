// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewDPM _$ViewDPMFromJson(Map<String, dynamic> json) => ViewDPM(
      id: json['id'] as String,
      htmlUrl: json['htmlUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewDPMToJson(ViewDPM instance) => <String, dynamic>{
      'id': instance.id,
      'htmlUrl': instance.htmlUrl,
      'title': instance.title,
      'description': instance.description,
      'tasks': instance.tasks,
    };
