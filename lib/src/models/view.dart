import 'package:dart_project_management_api/src/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'view.g.dart';

/// Represents a view in the system.
///
/// This class contains all the information of a view,
/// including its ID, HTML URL, title, description, and associated tasks.
@JsonSerializable()
class ViewDPM extends Equatable {
  /// Creates a new instance of [ViewDPM].
  ///
  /// All parameters are required and represent the complete
  /// information of a view.
  const ViewDPM({
    required this.id,
    required this.htmlUrl,
    required this.title,
    required this.description,
    required this.tasks,
  });

  /// Creates a [ViewDPM] instance from JSON.
  factory ViewDPM.fromJson(Map<String, dynamic> json) =>
      _$ViewDPMFromJson(json);

  /// The unique identifier of the view.
  @JsonKey(name: 'id')
  final String id;

  /// The HTML URL of the view.
  @JsonKey(name: 'htmlUrl')
  final String htmlUrl;

  /// The title of the view.
  @JsonKey(name: 'title')
  final String title;

  /// The description of the view.
  @JsonKey(name: 'description')
  final String description;

  /// The list of tasks associated with the view.
  @JsonKey(name: 'tasks')
  final List<Task> tasks;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$ViewDPMToJson(this);

  @override
  List<Object?> get props => [id, htmlUrl, title, description, tasks];
}
