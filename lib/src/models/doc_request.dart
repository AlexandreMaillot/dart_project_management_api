import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doc_request.g.dart';

/// Represents a request to create or update a document in the DPM system.
///
/// This class contains all the necessary information to create or update a document,
/// including its title, folder, and text content.
@JsonSerializable()
class DocRequest extends Equatable {
  /// Creates a new instance of [DocRequest].
  const DocRequest({
    required this.title,
    required this.folderName,
    required this.text,
  });

  /// Creates a [DocRequest] instance from JSON.
  factory DocRequest.fromJson(Map<String, dynamic> json) =>
      _$DocRequestFromJson(json);

  /// The title of the document.
  final String title;

  /// The folder path where the document should be located.
  final String folderName;

  /// The text content of the document.
  final String text;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$DocRequestToJson(this);

  @override
  List<Object?> get props => [title, folderName, text];
}
