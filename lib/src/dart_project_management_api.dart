import 'dart:convert';

import 'package:dart_project_management_api/src/models/comment.dart';
import 'package:dart_project_management_api/src/models/comment_request.dart';
import 'package:dart_project_management_api/src/models/config_dart_project_management.dart';
import 'package:dart_project_management_api/src/models/dartboard.dart';
import 'package:dart_project_management_api/src/models/doc.dart';
import 'package:dart_project_management_api/src/models/doc_list_response.dart';
import 'package:dart_project_management_api/src/models/doc_request.dart';
import 'package:dart_project_management_api/src/models/folder.dart';
import 'package:dart_project_management_api/src/models/task.dart';
import 'package:dart_project_management_api/src/models/task_list_response.dart';
import 'package:dart_project_management_api/src/models/task_request.dart';
import 'package:dart_project_management_api/src/models/view.dart';
import 'package:http/http.dart';

/// {@template dart_project_management_api}
/// dart project management api
/// {@endtemplate}
class DartProjectManagementApi {
  /// {@macro dart_project_management_api}
  DartProjectManagementApi({
    required String apiKey,
    Client? client,
  })  : _apiKey = apiKey,
        _client = client ?? Client();

  final String _apiKey;
  final Client _client;

  String get _baseUrl => 'https://app.itsdart.com/api/v0/public';

  /// Retrieves the Dart project configuration from the API.
  ///
  /// This method performs a GET request to the `/config` endpoint to obtain
  /// the project configuration parameters.
  ///
  /// Returns a [Future] that resolves to a [ConfigDPM] object containing
  /// the project configuration.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final config = await api.getConfig();
  /// print(config);
  /// ```
  Future<ConfigDPM> getConfig() async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/config'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load config: ${response.statusCode}');
    }

    return ConfigDPM.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Creates a new comment on a task.
  ///
  /// This method performs a POST request to the `/comments` endpoint to create
  /// a new comment on a specified task.
  ///
  /// The [request] parameter must contain the task ID and comment text.
  ///
  /// Returns a [Future] that resolves to a [Comment] object containing
  /// the created comment information.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final request = CommentRequest(taskId: 'task123', text: 'My comment');
  /// final comment = await api.createComment(request);
  /// print(comment);
  /// ```
  Future<Comment> createComment(CommentRequest request) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/comments'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'item': request.toJson()}),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to create comment: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Comment.fromJson(json['item'] as Map<String, dynamic>);
  }

  /// Retrieves a dartboard by its ID.
  ///
  /// This method performs a GET request to the `/dartboards/{id}` endpoint to obtain
  /// the dartboard information.
  ///
  /// The [id] parameter must be a valid dartboard ID.
  ///
  /// Returns a [Future] that resolves to a [Dartboard] object containing
  /// the dartboard information.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final dartboard = await api.getDartboard('dartboard123');
  /// print(dartboard);
  /// ```
  Future<Dartboard> getDartboard(String id) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/dartboards/$id'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load dartboard: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Dartboard.fromJson(json['item'] as Map<String, dynamic>);
  }

  /// Creates a new task in the specified dartboard.
  ///
  /// Throws an exception if the task creation fails.
  Future<Task> createTask(TaskRequest request) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/tasks'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'item': request.toJson()}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create task: ${response.body}');
    }

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return Task.fromJson(jsonResponse['item'] as Map<String, dynamic>);
  }

  /// Gets a task by its ID.
  ///
  /// Throws an exception if the task is not found or if the request fails.
  Future<Task> getTask(String taskId) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/tasks/$taskId'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get task: ${response.body}');
    }

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return Task.fromJson(jsonResponse['item'] as Map<String, dynamic>);
  }

  /// Updates an existing task.
  ///
  /// Throws an exception if the task update fails.
  Future<Task> updateTask(String taskId, TaskRequest request) async {
    final response = await _client.put(
      Uri.parse('$_baseUrl/tasks/$taskId'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'item': request.toJson()}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task: ${response.body}');
    }

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return Task.fromJson(jsonResponse['item'] as Map<String, dynamic>);
  }

  /// Deletes a task by its ID.
  ///
  /// Throws an exception if the task deletion fails.
  Future<void> deleteTask(String taskId) async {
    final response = await _client.delete(
      Uri.parse('$_baseUrl/tasks/$taskId'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 400) {
      throw Exception(
        'Invalid request, including the errors: ${response.body}',
      );
    }

    if (response.statusCode == 404) {
      throw Exception('Task not found: ${response.body}');
    }
  }

  /// Lists tasks based on various optional filters.
  ///
  /// All parameters are optional and can be used to filter the tasks:
  /// - [assignee]: Filter by assignee name
  /// - [assigneeId]: Filter by assignee ID
  /// - [dartboard]: Filter by dartboard name
  /// - [dartboardId]: Filter by dartboard ID
  /// - [description]: Filter by description
  /// - [dueAtAfter]: Filter tasks due after this date
  /// - [dueAtBefore]: Filter tasks due before this date
  /// - [ids]: Filter by task IDs (comma-separated)
  /// - [limit]: Maximum number of tasks to return
  /// - [offset]: Number of tasks to skip
  /// - [priority]: Filter by priority
  /// - [size]: Filter by size
  /// - [startAtAfter]: Filter tasks starting after this date
  /// - [startAtBefore]: Filter tasks starting before this date
  /// - [status]: Filter by status name
  /// - [statusId]: Filter by status ID
  /// - [tag]: Filter by tag name
  /// - [tagId]: Filter by tag ID
  /// - [title]: Filter by title
  /// - [type]: Filter by type name
  /// - [typeId]: Filter by type ID
  ///
  /// Returns a [Future] that resolves to a [TaskListResponse] containing
  /// the filtered tasks and pagination information.
  ///
  /// Throws an [Exception] if the request fails.
  Future<TaskListResponse> listTasks({
    String? assignee,
    String? assigneeId,
    String? dartboard,
    String? dartboardId,
    String? description,
    DateTime? dueAtAfter,
    DateTime? dueAtBefore,
    String? ids,
    int? limit,
    int? offset,
    String? priority,
    String? size,
    DateTime? startAtAfter,
    DateTime? startAtBefore,
    String? status,
    String? statusId,
    String? tag,
    String? tagId,
    String? title,
    String? type,
    String? typeId,
    bool? inTrash,
    bool? isCompleted,
  }) async {
    final queryParameters = <String, String>{};
    if (assignee != null) queryParameters['assignee'] = assignee;
    if (assigneeId != null) queryParameters['assignee_id'] = assigneeId;
    if (dartboard != null) queryParameters['dartboard'] = dartboard;
    if (dartboardId != null) queryParameters['dartboard_id'] = dartboardId;
    if (description != null) queryParameters['description'] = description;
    if (dueAtAfter != null) {
      queryParameters['due_at_after'] =
          dueAtAfter.toIso8601String().substring(0, 10);
    }
    if (dueAtBefore != null) {
      queryParameters['due_at_before'] =
          dueAtBefore.toIso8601String().substring(0, 10);
    }
    if (ids != null) queryParameters['ids'] = ids;
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (offset != null) queryParameters['offset'] = offset.toString();
    if (priority != null) queryParameters['priority'] = priority;
    if (size != null) queryParameters['size'] = size;
    if (startAtAfter != null) {
      queryParameters['start_at_after'] =
          startAtAfter.toIso8601String().substring(0, 10);
    }
    if (startAtBefore != null) {
      queryParameters['start_at_before'] =
          startAtBefore.toIso8601String().substring(0, 10);
    }
    if (status != null) queryParameters['status'] = status;
    if (statusId != null) queryParameters['status_id'] = statusId;
    if (tag != null) queryParameters['tag'] = tag;
    if (tagId != null) queryParameters['tag_id'] = tagId;
    if (title != null) queryParameters['title'] = title;
    if (type != null) queryParameters['type'] = type;
    if (typeId != null) queryParameters['type_id'] = typeId;
    if (inTrash != null) queryParameters['in_trash'] = inTrash.toString();
    if (isCompleted != null) {
      queryParameters['is_completed'] = isCompleted.toString();
    }
    final uri = Uri.parse('$_baseUrl/tasks/list').replace(
      queryParameters: queryParameters,
    );

    final response = await _client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to list tasks: ${response.body}');
    }

    print(response.body);
    return TaskListResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  /// Retrieves a folder by its ID.
  ///
  /// This method performs a GET request to the `/folders/{id}` endpoint to obtain
  /// the folder information and its documents.
  ///
  /// The [id] parameter must be a valid folder ID.
  ///
  /// Returns a [Future] that resolves to a [Folder] object containing
  /// the folder information and its documents.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final folder = await api.getFolder('folder123');
  /// print(folder);
  /// ```
  Future<Folder> getFolder(String id) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/folders/$id'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load folder: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Folder.fromJson(json['item'] as Map<String, dynamic>);
  }

  /// Retrieves a view by its ID.
  ///
  /// This method performs a GET request to the `/views/{id}` endpoint to obtain
  /// the view information and its associated tasks.
  ///
  /// The [id] parameter must be a valid view ID.
  ///
  /// Returns a [Future] that resolves to a [ViewDPM] object containing
  /// the view information and its tasks.
  ///
  /// Throws an [Exception] with specific error messages for different status codes:
  /// - 400: Invalid request
  /// - 404: View not found
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final view = await api.getView('view123');
  /// print(view);
  /// ```
  Future<ViewDPM> getView(String id) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl/views/$id'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 400) {
      throw Exception('Invalid request: ${response.body}');
    }

    if (response.statusCode == 404) {
      throw Exception('View not found: ${response.body}');
    }

    if (response.statusCode != 200) {
      throw Exception('Failed to load view: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return ViewDPM.fromJson(json['item'] as Map<String, dynamic>);
  }

  /// Creates a new document in the specified folder.
  ///
  /// This method performs a POST request to the `/docs` endpoint to create
  /// a new document with the specified title, folder, and text content.
  ///
  /// The [request] parameter must contain the document title, folder path, and text content.
  ///
  /// Returns a [Future] that resolves to a [Doc] object containing
  /// the created document information.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final request = DocRequest(
  ///   title: 'My Document',
  ///   folder: 'My Folder',
  ///   text: 'Document content',
  /// );
  /// final doc = await api.createDoc(request);
  /// print(doc);
  /// ```
  Future<Doc> createDoc(DocRequest request) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/docs'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'item': request.toJson()}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create document: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Doc.fromJson(json['item'] as Map<String, dynamic>);
  }

  /// Updates an existing document.
  ///
  /// This method performs a PUT request to the `/docs/{id}` endpoint to update
  /// an existing document with new information.
  ///
  /// The [id] parameter must be a valid document ID.
  /// The [request] parameter must contain the updated document information.
  ///
  /// Returns a [Future] that resolves to a [Doc] object containing
  /// the updated document information.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final request = DocRequest(
  ///   title: 'Updated Document',
  ///   folder: 'My Folder',
  ///   text: 'Updated content',
  /// );
  /// final doc = await api.updateDoc('doc123', request);
  /// print(doc);
  /// ```
  Future<Doc> updateDoc(String id, DocRequest request) async {
    final response = await _client.put(
      Uri.parse('$_baseUrl/docs/$id'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'item': request.toJson()}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update document: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Doc.fromJson(json['item'] as Map<String, dynamic>);
  }

  /// Deletes a document by its ID.
  ///
  /// This method performs a DELETE request to the `/docs/{id}` endpoint to delete
  /// an existing document.
  ///
  /// The [id] parameter must be a valid document ID.
  ///
  /// Throws an [Exception] if the request fails with a status code other than 200.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// await api.deleteDoc('doc123');
  /// ```
  Future<void> deleteDoc(String id) async {
    final response = await _client.delete(
      Uri.parse('$_baseUrl/docs/$id'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete document: ${response.statusCode}');
    }
  }

  /// Lists documents based on various optional filters.
  ///
  /// All parameters are optional and can be used to filter the documents:
  /// - [folder]: Filter by folder path
  /// - [limit]: Maximum number of documents to return
  /// - [offset]: Number of documents to skip
  /// - [title]: Filter by title
  ///
  /// Returns a [Future] that resolves to a [DocListResponse] containing
  /// the filtered documents and pagination information.
  ///
  /// Throws an [Exception] if the request fails.
  ///
  /// Example usage:
  /// ```dart
  /// final api = DartProjectManagementApi(apiKey: 'your_api_key');
  /// final response = await api.listDocs(
  ///   folder: 'My Folder',
  ///   limit: 10,
  ///   offset: 0,
  /// );
  /// print('Total documents: ${response.count}');
  /// print('Documents in this page: ${response.results.length}');
  /// ```
  Future<DocListResponse> listDocs({
    String? folder,
    int? limit,
    int? offset,
    String? title,
  }) async {
    final queryParameters = <String, String>{};
    if (folder != null) queryParameters['folder'] = folder;
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (offset != null) queryParameters['offset'] = offset.toString();
    if (title != null) queryParameters['title'] = title;

    final uri = Uri.parse('$_baseUrl/docs/list').replace(
      queryParameters: queryParameters,
    );

    final response = await _client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to list documents: ${response.statusCode}');
    }

    return DocListResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
