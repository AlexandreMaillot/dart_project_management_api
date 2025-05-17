import 'package:dart_project_management_api/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assignee.g.dart';

/// Represents a person assigned to a task or project.
///
/// This class contains basic assignee information
/// such as name and email. It is similar to [UserDPM] but
/// can represent people external to the system.
@JsonSerializable()
class AssigneeDPM extends Equatable {
  /// Creates a new instance of [AssigneeDPM].
  ///
  /// Both [name] and [email] parameters are required.
  const AssigneeDPM({
    required this.name,
    required this.email,
  });

  /// Creates an [AssigneeDPM] instance from JSON.
  ///
  /// The JSON must contain 'name' and 'email' keys.
  factory AssigneeDPM.fromJson(Map<String, dynamic> json) =>
      _$AssigneeDPMFromJson(json);

  /// The full name of the assignee.
  final String name;

  /// The email address of the assignee.
  final String email;

  /// Converts this instance to JSON.
  ///
  /// Returns a [Map] containing 'name' and 'email' keys.
  Map<String, dynamic> toJson() => _$AssigneeDPMToJson(this);

  @override
  List<Object?> get props => [name, email];
}
