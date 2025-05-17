// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_dart_project_management.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigDPM _$ConfigDPMFromJson(Map<String, dynamic> json) => ConfigDPM(
      today: json['today'] as String,
      user: UserDPM.fromJson(json['user'] as Map<String, dynamic>),
      dartboards: (json['dartboards'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      folders:
          (json['folders'] as List<dynamic>).map((e) => e as String).toList(),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      statuses:
          (json['statuses'] as List<dynamic>).map((e) => e as String).toList(),
      assignees: (json['assignees'] as List<dynamic>)
          .map((e) => AssigneeDPM.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      priorities: (json['priorities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ConfigDPMToJson(ConfigDPM instance) => <String, dynamic>{
      'today': instance.today,
      'user': instance.user,
      'dartboards': instance.dartboards,
      'folders': instance.folders,
      'types': instance.types,
      'statuses': instance.statuses,
      'assignees': instance.assignees,
      'tags': instance.tags,
      'priorities': instance.priorities,
      'sizes': instance.sizes,
    };
