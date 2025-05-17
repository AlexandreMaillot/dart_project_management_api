import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_request.g.dart';

/// Represents a comment creation request.
///
/// This class contains the necessary information to create a new comment
/// on a task.
@JsonSerializable()
class CommentRequest extends Equatable {
  /// Creates a new instance of [CommentRequest].
  ///
  /// [taskId] and [text] are required to create a comment.
  const CommentRequest({
    required this.taskId,
    required this.text,
  });

  /// Creates a [CommentRequest] instance from JSON.
  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);

  /// The ID of the task on which the comment is created.
  final String taskId;

  /// The text content of the comment.
  final String text;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);

  @override
  List<Object?> get props => [taskId, text];
}
