import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

/// Represents a comment in the system.
///
/// This class contains all the information of a comment,
/// including its ID, HTML URL, task ID, author, and content.
@JsonSerializable()
class Comment extends Equatable {
  /// Creates a new instance of [Comment].
  ///
  /// All parameters are required and represent the complete
  /// information of a comment.
  const Comment({
    required this.id,
    required this.htmlUrl,
    required this.taskId,
    required this.author,
    required this.text,
  });

  /// Creates a [Comment] instance from JSON.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// The unique identifier of the comment.
  final String id;

  /// The HTML URL of the comment.
  final String htmlUrl;

  /// The ID of the task associated with the comment.
  final String taskId;

  /// The author of the comment.
  final String author;

  /// The text content of the comment.
  final String text;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  List<Object?> get props => [id, htmlUrl, taskId, author, text];
}
