import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_request.g.dart';

/// Represents a request to create or update a task in the DPM system.
@JsonSerializable()
class TaskRequest extends Equatable {
  /// Creates a new instance of [TaskRequest].
  const TaskRequest({
    required this.dartboard,
    required this.title,
    required this.description,
    this.parentId,
    this.type,
    this.status,
    this.assignees,
    this.assignee,
    this.tags,
    this.priority,
    this.startAt,
    this.dueAt,
    this.size,
  });

  /// Creates a [TaskRequest] instance from JSON.
  factory TaskRequest.fromJson(Map<String, dynamic> json) =>
      _$TaskRequestFromJson(json);

  /// The ID of the dartboard this task belongs to.
  final String dartboard;

  /// The title of the task.
  final String title;

  /// The description of the task.
  final String description;

  /// The ID of the parent task, if any.
  final String? parentId;

  /// The type of the task.
  final String? type;

  /// The current status of the task.
  final String? status;

  /// The list of assignees for this task.
  final List<String>? assignees;

  /// The main assignee of the task.
  final String? assignee;

  /// The list of tags associated with the task.
  final List<String>? tags;

  /// The priority level of the task.
  final String? priority;

  /// The start date of the task.
  final String? startAt;

  /// The due date of the task.
  final String? dueAt;

  /// The size of the task.
  final String? size;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$TaskRequestToJson(this);

  @override
  List<Object?> get props => [
        dartboard,
        title,
        description,
        parentId,
        type,
        status,
        assignees,
        assignee,
        tags,
        priority,
        startAt,
        dueAt,
        size,
      ];
}
