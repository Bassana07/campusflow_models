import 'dart:convert';

import 'course.dart';
import 'task.dart';
import 'user.dart';

/// Dépôt simulé : charge des données JSON en dur après un petit délai,
/// comme le ferait un vrai appel réseau.
class FakeRepository {
  final Duration latency;

  const FakeRepository({this.latency = const Duration(milliseconds: 500)});

  Future<List<Course>> fetchCourses() async {
    await Future<void>.delayed(latency);
    return _decodeList(_coursesJson, Course.fromJson);
  }

  Future<List<Task>> fetchTasks() async {
    await Future<void>.delayed(latency);
    return _decodeList(_tasksJson, Task.fromJson);
  }

  Future<User> fetchUser() async {
    await Future<void>.delayed(latency);
    return User.fromJson(jsonDecode(_userJson) as Map<String, dynamic>);
  }

  List<T> _decodeList<T>(
    String source,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final list = jsonDecode(source) as List<dynamic>;
    return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}

const _coursesJson = '''
[
  {"id": "c1", "name": "Programmation mobile", "teacher": "M. Ouédraogo", "credits": 4},
  {"id": "c2", "name": "Bases de données", "teacher": "Mme Sawadogo", "credits": 3}
]
''';

const _tasksJson = '''
[
  {"id": "t1", "title": "Rendre le TP Dart", "courseId": "c1", "dueDate": "2026-10-30T23:59:00.000", "isDone": false},
  {"id": "t2", "title": "Réviser le modèle relationnel", "courseId": "c2", "dueDate": "2026-11-05T12:00:00.000", "isDone": true}
]
''';

const _userJson = '''
{"id": "u1", "name": "Awa Traoré", "email": "awa@campus.bf", "courseIds": ["c1", "c2"]}
''';
