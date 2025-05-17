import 'package:dart_project_management_api/src/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dartboard.g.dart';

/// Represents a Dartboard in the DPM system.
/// A dartboard is a container for tasks and can be used to organize work.
@JsonSerializable()
class Dartboard extends Equatable {
  /// Creates a new instance of [Dartboard].
  const Dartboard({
    required this.id,
    required this.htmlUrl,
    required this.title,
    required this.description,
    required this.tasks,
  });

  /// Creates a [Dartboard] instance from JSON.
  factory Dartboard.fromJson(Map<String, dynamic> json) =>
      _$DartboardFromJson(json);

  /// The unique identifier of the dartboard
  final String id;

  /// The URL to view the dartboard in the web interface
  final String htmlUrl;

  /// The title of the dartboard
  final String title;

  /// The description of the dartboard
  final String description;

  /// The list of tasks associated with this dartboard
  final List<Task> tasks;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$DartboardToJson(this);

  @override
  List<Object?> get props => [id, htmlUrl, title, description, tasks];
}
