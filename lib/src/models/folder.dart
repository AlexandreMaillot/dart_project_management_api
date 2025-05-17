// ignore_for_file: directives_ordering

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:dart_project_management_api/src/models/doc.dart';

part 'folder.g.dart';

/// Represents a folder in the DPM system.
///
/// This class contains all the information of a folder,
/// including its ID, HTML URL, title, description, and list of documents.
@JsonSerializable()
class Folder extends Equatable {
  /// Creates a new instance of [Folder].
  const Folder({
    required this.id,
    required this.htmlUrl,
    required this.title,
    required this.description,
    required this.docs,
  });

  /// Creates a [Folder] instance from JSON.
  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  /// The unique identifier of the folder.
  final String id;

  /// The HTML URL of the folder.
  final String htmlUrl;

  /// The title of the folder.
  final String title;

  /// The description of the folder.
  final String description;

  /// The list of documents in this folder.
  final List<Doc> docs;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$FolderToJson(this);

  @override
  List<Object?> get props => [id, htmlUrl, title, description, docs];
}
