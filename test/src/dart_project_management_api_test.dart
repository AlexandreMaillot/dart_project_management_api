// ignore_for_file: prefer_const_constructors

import 'package:dart_project_management_api/dart_project_management_api.dart';
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
import 'package:test/test.dart';

const apiKey = 'dsa_xxxx';
const dartboardId = 'xxxx';
const taskId = 'xxxx';
const dartboard = 'xxxx';
void main() {
  late DartProjectManagementApi api;

  setUp(() {
    api = DartProjectManagementApi(
      apiKey: apiKey,
      client: Client(),
    );
  });

  group('DartProjectManagementApi', () {
    test('can be instantiated', () {
      expect(api, isNotNull);
    });
    test('can get config', () async {
      final config = await api.getConfig();
      expect(config, isA<ConfigDPM>());
    });
    test('can create comment', () async {
      final request = CommentRequest(
        taskId: taskId,
        text: 'Test comment',
      );
      final comment = await api.createComment(request);
      expect(comment, isA<Comment>());
      expect(comment.taskId, equals(taskId));
      expect(comment.text, equals('Test comment'));
      expect(comment.id, isNotEmpty);
      expect(comment.htmlUrl, isNotEmpty);
      expect(comment.author, isNotEmpty);
    });
    test('throws exception when comment creation fails', () async {
      final request = CommentRequest(
        taskId: 'invalid_task',
        text: 'Test comment',
      );
      expect(
        () => api.createComment(request),
        throwsException,
      );
    });
    test('can get dartboard', () async {
      final dartboard = await api.getDartboard(dartboardId);
      expect(dartboard, isA<Dartboard>());
      expect(dartboard.id, equals(dartboardId));
      expect(dartboard.title, isNotEmpty);
      expect(dartboard.description, isNotNull);
      expect(dartboard.htmlUrl, isNotEmpty);
      expect(dartboard.tasks, isNotEmpty);
    });

    test('throws exception when getting non-existent dartboard', () async {
      expect(
        () => api.getDartboard('invalid_dartboard'),
        throwsException,
      );
    });

    test('can create task', () async {
      final request = TaskRequest(
        dartboard: dartboard,
        title: 'Test task',
        description: 'This is a test task',
      );
      final task = await api.createTask(request);
      expect(task, isA<Task>());
      expect(task.dartboard, equals(dartboard));
      expect(task.title, equals('Test task'));
      expect(task.description, equals('This is a test task'));
      expect(task.id, isNotEmpty);
      expect(task.htmlUrl, isNotEmpty);
    });

    test('can get task', () async {
      final task = await api.getTask(taskId);
      expect(task, isA<Task>());
      expect(task.id, equals(taskId));
      expect(task.title, isNotEmpty);
      expect(task.description, isNotNull);
      expect(task.htmlUrl, isNotEmpty);
    });

    test('can update task', () async {
      final request = TaskRequest(
        dartboard: 'PriseNote/Tasks',
        title: 'Updated test task',
        description: 'This is an updated test task',
      );
      final task = await api.updateTask(taskId, request);
      expect(task, isA<Task>());
      expect(task.id, equals(taskId));
      expect(task.title, equals('Updated test task'));
      expect(task.description, equals('This is an updated test task'));
    });

    test('can delete task', () async {
      final task = await api.createTask(
        TaskRequest(
          dartboard: dartboard,
          title: 'Test task',
          description: 'This is a test task',
        ),
      );

      await api.deleteTask(task.id!);
      expect(
        () => api.getTask(taskId),
        throwsException,
      );
    });

    test('throws exception when getting non-existent task', () async {
      expect(
        () => api.getTask('invalid_task'),
        throwsException,
      );
    });

    test('throws exception when updating non-existent task', () async {
      final request = TaskRequest(
        dartboard: dartboard,
        title: 'Test task',
        description: 'This is a test task',
      );
      expect(
        () => api.updateTask('invalid_task', request),
        throwsException,
      );
    });

    test('throws exception when deleting non-existent task', () async {
      expect(
        () => api.deleteTask('invalid_task'),
        throwsException,
      );
    });

    test('can list tasks with filters', () async {
      final response = await api.listTasks(
        limit: 1,
        offset: 0,
        isCompleted: true,
      );
      expect(response, isA<TaskListResponse>());
      expect(response.count, isPositive);
      expect(response.results, isA<List<Task>>());
      expect(response.results, isNotEmpty);
      expect(response.results.first, isA<Task>());
    });

    test('can list tasks without filters', () async {
      final response = await api.listTasks();
      expect(response, isA<TaskListResponse>());
      expect(response.count, isPositive);
      expect(response.results, isA<List<Task>>());
    });
  });

  group('getFolder', () {
    test('returns Folder when the API call is successful', () async {
      final folder = await api.getFolder('8xQgNLtdwMbr');

      expect(folder, isA<Folder>());
      expect(folder.id, equals('8xQgNLtdwMbr'));
    });

    test('throws an exception when the API call is unsuccessful', () async {
      expect(
        () => api.getFolder('invalid_id'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getView', () {
    test('returns View when the API call is successful', () async {
      final view = await api.getView('SjrxN76n5PQU');

      expect(view, isA<ViewDPM>());
      expect(view.id, equals('SjrxN76n5PQU'));
      expect(view.title, isNotEmpty);
      expect(view.description, isNotNull);
      expect(view.htmlUrl, isNotEmpty);
      expect(view.tasks, isNotEmpty);
      expect(view.tasks.first, isA<Task>());
    });

    test('throws an exception with 400 status code when the request is invalid',
        () async {
      expect(
        () => api.getView('invalid_format'),
        throwsA(isA<Exception>()),
      );
    });

    test('throws an exception with 404 status code when the view is not found',
        () async {
      expect(
        () => api.getView('non_existent_view'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('Doc operations', () {
    test('can create document', () async {
      final request = DocRequest(
        title: 'Test Document',
        folderName: 'General/Docs',
        text: 'This is a test document',
      );
      final doc = await api.createDoc(request);
      expect(doc, isA<Doc>());
      expect(doc.title, equals('Test Document'));
      expect(doc.folder, equals('General/Docs'));
      expect(doc.text, equals('This is a test document'));
      expect(doc.id, isNotEmpty);
      expect(doc.htmlUrl, isNotEmpty);
    });

    test('throws exception when document creation fails', () async {
      final request = DocRequest(
        title: '',
        folderName: '',
        text: '',
      );
      expect(
        () => api.createDoc(request),
        throwsA(isA<Exception>()),
      );
    });

    test('can update document', () async {
      // First create a document
      final createRequest = DocRequest(
        title: 'Original Document',
        folderName: 'General/Docs',
        text: 'Original content',
      );
      final createdDoc = await api.createDoc(createRequest);

      // Then update it
      final updateRequest = DocRequest(
        title: 'Updated Document',
        folderName: 'General/Docs',
        text: 'Updated content',
      );
      final updatedDoc = await api.updateDoc(createdDoc.id, updateRequest);

      expect(updatedDoc, isA<Doc>());
      expect(updatedDoc.id, equals(createdDoc.id));
      expect(updatedDoc.title, equals('Updated Document'));
      expect(updatedDoc.text, equals('Updated content'));
    });

    test('throws exception when updating non-existent document', () async {
      final request = DocRequest(
        title: 'Test Document',
        folderName: 'Test Folder',
        text: 'Test content',
      );
      expect(
        () => api.updateDoc('invalid_doc_id', request),
        throwsA(isA<Exception>()),
      );
    });

    test('can delete document', () async {
      // First create a document
      final request = DocRequest(
        title: 'Document to Delete',
        folderName: 'Test Folder',
        text: 'This document will be deleted',
      );
      final doc = await api.createDoc(request);

      // Then delete it
      await api.deleteDoc(doc.id);

      // Verify it's deleted by trying to update it
      expect(
        () => api.updateDoc('invalid_doc_id', request),
        throwsA(isA<Exception>()),
      );
    });

    test('throws exception when deleting non-existent document', () async {
      expect(
        () => api.deleteDoc('invalid_doc_id'),
        throwsException,
      );
    });

    test('can list documents with filters', () async {
      final response = await api.listDocs(
        folder: 'General/Docs',
        limit: 10,
        offset: 0,
      );
      expect(response, isA<DocListResponse>());
      expect(response.count, isPositive);
      expect(response.results, isA<List<Doc>>());
      expect(response.results, isNotEmpty);
      expect(response.results.first, isA<Doc>());
    });

    test('can list documents without filters', () async {
      final response = await api.listDocs();
      expect(response, isA<DocListResponse>());
      expect(response.count, isPositive);
      expect(response.results, isA<List<Doc>>());
    });
  });
}
