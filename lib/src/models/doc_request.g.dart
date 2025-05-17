// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocRequest _$DocRequestFromJson(Map<String, dynamic> json) => DocRequest(
      title: json['title'] as String,
      folderName: json['folderName'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$DocRequestToJson(DocRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'folderName': instance.folderName,
      'text': instance.text,
    };
