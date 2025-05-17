import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

/// Represents a task in the DPM system.
///
/// This class contains all the information of a task,
/// including its ID, HTML URL, title, description, and other metadata.
@JsonSerializable()
class Task extends Equatable {
  /// Creates a new instance of [Task].
  const Task({
    required this.id,
    required this.htmlUrl,
    required this.title,
    required this.parentId,
    required this.dartboard,
    required this.type,
    required this.status,
    required this.description,
    required this.assignees,
    required this.assignee,
    required this.tags,
    required this.priority,
    required this.startAt,
    required this.dueAt,
    required this.size,
    required this.timeTracking,
  });

  /// Creates a [Task] instance from JSON.
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// The unique identifier of the task.
  final String? id;

  /// The HTML URL of the task.
  final String? htmlUrl;

  /// The title of the task.
  final String? title;

  /// The ID of the parent task, if any.
  final String? parentId;

  /// The ID of the dartboard this task belongs to.
  final String? dartboard;

  /// The type of the task.
  final String type;

  /// The current status of the task.
  final String status;

  /// The description of the task.
  final String description;

  /// The list of assignees for this task.
  final List<String>? assignees;

  /// The main assignee of the task.
  final String? assignee;

  /// The list of tags associated with the task.
  final List<String> tags;

  /// The priority level of the task.
  final String? priority;

  /// The start date of the task.
  @JsonKey(fromJson: _dateFromString, toJson: _dateToString)
  final DateTime? startAt;

  /// The due date of the task.
  @JsonKey(fromJson: _dateFromString, toJson: _dateToString)
  final DateTime? dueAt;

  /// The size of the task.
  final String? size;

  /// The time tracking information for the task.
  final String? timeTracking;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  List<Object?> get props => [
        id,
        htmlUrl,
        title,
        parentId,
        dartboard,
        type,
        status,
        description,
        assignees,
        assignee,
        tags,
        priority,
        startAt,
        dueAt,
        size,
        timeTracking,
      ];

  /// Converts a date string in "YYYY-MM-DD" format to DateTime.
  static DateTime? _dateFromString(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;

    return DateTime.parse(dateString);
  }

  /// Converts a DateTime to a date string in "YYYY-MM-DD" format.
  static String? _dateToString(DateTime? date) {
    if (date == null || date.year == 0) return null;
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
