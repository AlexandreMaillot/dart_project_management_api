import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Represents a user in the system.
///
/// This class contains basic user information
/// such as name and email.
@JsonSerializable()
class UserDPM extends Equatable {
  /// Creates a new instance of [UserDPM].
  ///
  /// Both [name] and [email] parameters are required.
  const UserDPM({
    required this.name,
    required this.email,
  });

  /// Creates a [UserDPM] instance from JSON.
  ///
  /// The JSON must contain 'name' and 'email' keys.
  factory UserDPM.fromJson(Map<String, dynamic> json) => _$UserDPMFromJson(json);

  /// The full name of the user.
  final String name;

  /// The email address of the user.
  final String email;

  /// Converts this instance to JSON.
  ///
  /// Returns a [Map] containing 'name' and 'email' keys.
  Map<String, dynamic> toJson() => _$UserDPMToJson(this);

  @override
  List<Object?> get props => [name, email];
}
