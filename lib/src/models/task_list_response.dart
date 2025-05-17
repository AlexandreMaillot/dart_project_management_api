import 'package:dart_project_management_api/src/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_list_response.g.dart';

/// Represents a paginated response of tasks from the DPM system.
///
/// This class contains a list of tasks along with pagination information
/// such as total count, next and previous page URLs.
@JsonSerializable()
class TaskListResponse extends Equatable {
  /// Creates a new instance of [TaskListResponse].
  const TaskListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  /// Creates a [TaskListResponse] instance from JSON.
  factory TaskListResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskListResponseFromJson(json);

  /// The total number of tasks matching the query.
  final int count;

  /// The URL for the next page of results, if any.
  final String? next;

  /// The URL for the previous page of results, if any.
  final String? previous;

  /// The list of tasks in the current page.
  final List<Task> results;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$TaskListResponseToJson(this);

  @override
  List<Object?> get props => [count, next, previous, results];
}
