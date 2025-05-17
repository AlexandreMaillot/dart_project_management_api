import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doc.g.dart';

/// Represents a document in the DPM system.
///
/// This class contains all the information of a document,
/// including its ID, HTML URL, title, folder, and text content.
@JsonSerializable()
class Doc extends Equatable {
  /// Creates a new instance of [Doc].
  const Doc({
    required this.id,
    required this.htmlUrl,
    required this.title,
    required this.folder,
    required this.text,
  });

  /// Creates a [Doc] instance from JSON.
  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);

  /// The unique identifier of the document.
  final String id;

  /// The HTML URL of the document.
  final String htmlUrl;

  /// The title of the document.
  final String title;

  /// The folder path where the document is located.
  final String folder;

  /// The text content of the document.
  final String text;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$DocToJson(this);

  @override
  List<Object?> get props => [id, htmlUrl, title, folder, text];
}
