// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String,
      htmlUrl: json['htmlUrl'] as String,
      taskId: json['taskId'] as String,
      author: json['author'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'htmlUrl': instance.htmlUrl,
      'taskId': instance.taskId,
      'author': instance.author,
      'text': instance.text,
    };
