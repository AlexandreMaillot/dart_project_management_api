// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doc _$DocFromJson(Map<String, dynamic> json) => Doc(
      id: json['id'] as String,
      htmlUrl: json['htmlUrl'] as String,
      title: json['title'] as String,
      folder: json['folder'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
      'id': instance.id,
      'htmlUrl': instance.htmlUrl,
      'title': instance.title,
      'folder': instance.folder,
      'text': instance.text,
    };
