import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:dart_project_management_api/src/models/doc.dart';

part 'doc_list_response.g.dart';

/// Represents a paginated response of documents from the DPM system.
///
/// This class contains the list of documents and pagination information
/// including the total count, next and previous page URLs.
@JsonSerializable()
class DocListResponse extends Equatable {
  /// Creates a new instance of [DocListResponse].
  const DocListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  /// Creates a [DocListResponse] instance from JSON.
  factory DocListResponse.fromJson(Map<String, dynamic> json) =>
      _$DocListResponseFromJson(json);

  /// The total number of documents available.
  final int count;

  /// The URL for the next page of results, if any.
  final String? next;

  /// The URL for the previous page of results, if any.
  final String? previous;

  /// The list of documents in the current page.
  final List<Doc> results;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$DocListResponseToJson(this);

  @override
  List<Object?> get props => [count, next, previous, results];
}
