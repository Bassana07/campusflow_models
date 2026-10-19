import 'json_helpers.dart';

/// Un cours dispensé sur le campus.
class Course {
  final String id;
  final String name;
  final String teacher;
  final int credits;

  const Course({
    required this.id,
    required this.name,
    required this.teacher,
    required this.credits,
  });

  /// Retourne une copie du cours avec les champs fournis modifiés.
  Course copyWith({
    String? id,
    String? name,
    String? teacher,
    int? credits,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      teacher: teacher ?? this.teacher,
      credits: credits ?? this.credits,
    );
  }

  /// Construit un [Course] depuis un JSON.
  ///
  /// Lance une [FormatException] si un champ est absent ou invalide.
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: readField<String>(json, 'id'),
      name: readField<String>(json, 'name'),
      teacher: readField<String>(json, 'teacher'),
      credits: readField<int>(json, 'credits'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'teacher': teacher,
        'credits': credits,
      };

  @override
  String toString() =>
      'Course(id: $id, name: $name, teacher: $teacher, credits: $credits)';
}
