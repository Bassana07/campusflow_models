import 'json_helpers.dart';

/// Un utilisateur (étudiant) de CampusFlow.
class User {
  final String id;
  final String name;
  final String email;
  final List<String> courseIds;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.courseIds = const [],
  });

  /// Retourne une copie de l'utilisateur avec les champs fournis modifiés.
  User copyWith({
    String? id,
    String? name,
    String? email,
    List<String>? courseIds,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      courseIds: courseIds ?? this.courseIds,
    );
  }

  /// Construit un [User] depuis un JSON.
  ///
  /// Lance une [FormatException] si un champ est absent ou invalide.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: readField<String>(json, 'id'),
      name: readField<String>(json, 'name'),
      email: readField<String>(json, 'email'),
      courseIds: readStringList(json, 'courseIds'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'courseIds': courseIds,
      };

  @override
  String toString() =>
      'User(id: $id, name: $name, email: $email, courseIds: $courseIds)';
}
