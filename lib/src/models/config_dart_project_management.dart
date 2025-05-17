import 'package:dart_project_management_api/src/models/assignee.dart';
import 'package:dart_project_management_api/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_dart_project_management.g.dart';

/// Represents the configuration for a Dart project management system.
///
/// This class contains all the necessary configuration data including
/// user information, available boards, folders, types, statuses,
/// assignees, tags, priorities, and sizes.
@JsonSerializable()
class ConfigDPM extends Equatable {
  /// Creates a new instance of [ConfigDPM].
  ///
  /// All parameters are required and represent the complete configuration
  /// of the project management system.
  const ConfigDPM({
    required this.today,
    required this.user,
    required this.dartboards,
    required this.folders,
    required this.types,
    required this.statuses,
    required this.assignees,
    required this.tags,
    required this.priorities,
    required this.sizes,
  });

  /// Creates a [ConfigDPM] instance from JSON.
  ///
  /// The JSON must contain all required configuration keys.
  factory ConfigDPM.fromJson(Map<String, dynamic> json) =>
      _$ConfigDPMFromJson(json);

  /// The current date in the system.
  final String today;

  /// The current user of the system.
  final UserDPM user;

  /// List of available dartboards in the system.
  ///
  /// Each dartboard is represented as a path string (e.g., 'General/Active').
  final List<String> dartboards;

  /// List of available folders in the system.
  ///
  /// Each folder is represented as a path string (e.g., 'Personal/Getting started').
  final List<String> folders;

  /// List of available item types in the system.
  ///
  /// Examples include: 'Test', 'Story', 'Task', etc.
  final List<String> types;

  /// List of available statuses in the system.
  ///
  /// Examples include: 'IN PROGRESS', 'DONE', 'TODO', etc.
  final List<String> statuses;

  /// List of available assignees in the system.
  ///
  /// Each assignee contains name and email information.
  final List<AssigneeDPM> assignees;

  /// List of available tags in the system.
  ///
  /// Tags can be used to categorize items (e.g., 'Admin', 'Bug', 'Feature').
  final List<String> tags;

  /// List of available priority levels.
  ///
  /// Examples include: 'critical', 'high', 'medium', 'low'.
  final List<String> priorities;

  /// List of available size options.
  ///
  /// Examples include: 'extra small', 'small', 'medium', 'large', 'extra large'.
  final List<String> sizes;

  /// Converts this instance to JSON.
  ///
  /// Returns a [Map] containing all configuration data.
  Map<String, dynamic> toJson() => _$ConfigDPMToJson(this);

  @override
  List<Object?> get props => [
        today,
        user,
        dartboards,
        folders,
        types,
        statuses,
        assignees,
        tags,
        priorities,
        sizes,
      ];
}
