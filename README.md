# Dart Project Management Api

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

## About Dart 🎯

[Dart](https://www.itsdart.com/?nr=1) is an AI-powered project management platform that helps teams organize their work efficiently. It provides a modern interface for managing projects, tasks, and team collaboration, with features like AI-assisted task management, real-time updates, and powerful automation tools.

## About This API 🔌

This package is a Dart client library that allows you to interact with the Dart platform programmatically. It provides a simple way to:

- Create and manage projects
- Create and update tasks
- View project configuration
- Handle authentication with Dart's platform

### Example Usage

```dart
import 'package:dart_project_management_api/dart_project_management_api.dart';

void main() async {
  // Initialize the API with your Dart token
  final dartApi = DartProjectManagementApi(
    token: 'your-dart-token-here', // Get this from Dart Settings > Account
  );

  // Add a task
  final task = await dartApi.createTask(
    TaskRequest(
      dartboard: 'project_id',
      title: 'Implement new feature',
      description: 'Task description',
      // Add other optional fields if needed
    ),
  );

  // Ajouter un commentaire à une tâche
  final comment = await dartApi.createComment(
    CommentRequest(
      taskId: task.id!,
      text: 'This is a comment',
    ),
  );

  // View project configuration
  final config = await dartApi.getConfig();

  // Example of accessing configuration:
  print('Today\'s date: \\${config.today}');
  print('User: \\${config.user.name}');
  print('Available dartboards: \\${config.dartboards}');
  print('Available types: \\${config.types}');
  // ... other properties as needed
}
```

## Authentication 🔑

To use this API, you need to obtain an authentication token from your Dart account:

1. Log in to your [Dart account](https://www.itsdart.com)
2. Go to Settings > Account
3. Scroll down to find your API Token
4. Copy the token and use it to initialize the API

## Available Operations 📋

### Projects

- Create projects
- List projects
- Get project details
- Update project information
- Delete projects
- View project configuration

### Tasks

- Create tasks
- List project tasks
- Update task details
- Change task status
- Add comments to tasks

## Error Handling ⚠️

```dart
try {
  final project = await dartApi.createProject(
    name: 'New Project',
  );
} on DartApiException catch (e) {
  print('API Error: \\${e.message}');
}
```

### API Exceptions

All API errors throw a subclass of `DartApiException`. You can catch specific exceptions to handle different error cases:

- `DartApiUnauthorizedException` — The request was not authorized (HTTP 401)
- `DartApiNotFoundException` — The requested resource was not found (HTTP 404)
- `DartApiValidationException` — The request was invalid (HTTP 400)
- `DartApiNetworkException` — A network error occurred (connection issues, etc.)
- `DartApiUnknownException` — Any other error returned by the API

#### Example

```dart
try {
  final task = await dartApi.getTask('task-id');
} on DartApiNotFoundException catch (e) {
  print('Not found: \\${e.message}');
} on DartApiUnauthorizedException catch (e) {
  print('Unauthorized: \\${e.message}');
} on DartApiValidationException catch (e) {
  print('Validation error: \\${e.message}');
} on DartApiException catch (e) {
  print('API error: \\${e.message}');
}
```

## Description 📝

Dart Project Management Api is a comprehensive library that provides a simple and intuitive interface for managing projects, tasks, users, and teams. It is designed to be easy to integrate, performant, and extensible. Built to work harmoniously with Dart's AI-powered project management platform, this API enables developers to create custom integrations and extensions that leverage Dart's powerful AI capabilities.

## Integration with Dart Platform 🔄

This API is designed to work seamlessly with the Dart project management platform, offering:

### AI-Powered Features

- Automatic property filling for tasks
- AI-driven project planning
- Intelligent subtask generation
- AI chat integration
- Duplicate task detection
- Natural language processing for task creation
- Automated report generation

### Task Management

- List and board views
- Sprint planning and management
- Priority and size tracking
- Due date management
- Custom property fields
- Task dependencies
- Real-time updates

### Document Management

- Integrated document editor
- Meeting notes storage
- Task-document linking
- AI-powered report generation
- Changelog updates
- Standup meeting automation

### Views and Layouts

- Roadmap visualization
- Gantt charts
- Calendar views
- Custom board layouts
- Command center
- Team-specific views

### Integration Capabilities

- GitHub integration for development workflows
- Slack and Discord for team communication
- ChatGPT and Claude for AI assistance
- Microsoft Teams integration
- Zapier for workflow automation
- Google Calendar and Spreadsheets
- Notion integration
- Custom API endpoints

## Role-Based Features 👥

The API supports Dart's role-specific features:

### For Engineering Teams

- GitHub integration for PR tracking
- Sprint management
- Automated standup reports
- Code review workflows

### For Product Teams

- PRD drafting with AI
- User feedback tracking
- Project timeline estimation
- Feature prioritization

### For Design Teams

- AI-assisted design tasks
- Design asset management
- Task-document integration
- Voice control support

### For Sales Teams

- Pipeline management
- CRM integration
- Team communication tools
- Deal tracking

## Project Configuration ⚙️

The API allows you to view your Dart project configuration:

```dart
final dartApi = DartProjectManagementApi(
  token: 'your-dart-token-here',
);

// Get project configuration
final config = await dartApi.getConfig();

// La configuration contient les informations suivantes :
print('Current date: ${config.today}');
print('Current user: ${config.user}');
print('Available dartboards: ${config.dartboards}');
print('Available folders: ${config.folders}');
print('Available types: ${config.types}');
print('Available statuses: ${config.statuses}');
print('Available assignees: ${config.assignees}');
print('Available tags: ${config.tags}');
print('Available priorities: ${config.priorities}');
print('Available sizes: ${config.sizes}');
```

## Contributing 🤝

Contributions are welcome! Feel free to:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Links 🔗

- [Dart Project Management Platform](https://www.itsdart.com/?nr=1)
- [API Documentation](https://pub.dev/documentation/dart_project_management_api)
- [GitHub Repository](https://github.com/yourusername/dart_project_management_api)
- [Dart Help Center](https://www.itsdart.com/help)
- [Dart Changelog](https://www.itsdart.com/changelog)

[dart_install_link]: https://dart.dev/get-dart
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
