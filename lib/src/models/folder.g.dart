// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Folder _$FolderFromJson(Map<String, dynamic> json) => Folder(
      id: json['id'] as String,
      htmlUrl: json['htmlUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      docs: (json['docs'] as List<dynamic>)
          .map((e) => Doc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FolderToJson(Folder instance) => <String, dynamic>{
      'id': instance.id,
      'htmlUrl': instance.htmlUrl,
      'title': instance.title,
      'description': instance.description,
      'docs': instance.docs,
    };
