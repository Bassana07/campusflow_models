import 'json_helpers.dart';

/// Une tâche à faire, rattachée à un cours.
class Task {
  final String id;
  final String title;
  final String courseId;
  final DateTime dueDate;
  final bool isDone;

  const Task({
    required this.id,
    required this.title,
    required this.courseId,
    required this.dueDate,
    this.isDone = false,
  });

  /// Retourne une copie de la tâche avec les champs fournis modifiés.
  Task copyWith({
    String? id,
    String? title,
    String? courseId,
    DateTime? dueDate,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      courseId: courseId ?? this.courseId,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }

  /// Construit une [Task] depuis un JSON.
  ///
  /// Lance une [FormatException] si un champ est absent ou invalide.
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: readField<String>(json, 'id'),
      title: readField<String>(json, 'title'),
      courseId: readField<String>(json, 'courseId'),
      dueDate: DateTime.parse(readField<String>(json, 'dueDate')),
      isDone: readField<bool>(json, 'isDone'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'courseId': courseId,
        'dueDate': dueDate.toIso8601String(),
        'isDone': isDone,
      };

  @override
  String toString() =>
      'Task(id: $id, title: $title, courseId: $courseId, '
      'dueDate: $dueDate, isDone: $isDone)';
}
