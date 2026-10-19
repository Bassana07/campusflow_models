import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  test('copyWith modifie uniquement les champs demandés', () {
    final task = Task(
      id: 't1',
      title: 'Rendre le TP',
      courseId: 'c1',
      dueDate: DateTime(2026, 10, 30),
    );

    final done = task.copyWith(isDone: true);

    expect(done.isDone, isTrue);
    expect(done.id, task.id);
    expect(done.title, task.title);
    expect(done.dueDate, task.dueDate);
    expect(task.isDone, isFalse, reason: "l'original ne doit pas changer");
  });

  test('fromJson construit un Course correct', () {
    final course = Course.fromJson({
      'id': 'c1',
      'name': 'Programmation mobile',
      'teacher': 'M. Ouédraogo',
      'credits': 4,
    });

    expect(course.id, 'c1');
    expect(course.name, 'Programmation mobile');
    expect(course.teacher, 'M. Ouédraogo');
    expect(course.credits, 4);
  });

  test('fromJson lance une FormatException si un champ est invalide', () {
    expect(
      () => User.fromJson({'id': 'u1', 'name': 'Awa'}), // email absent
      throwsA(isA<FormatException>()),
    );
  });
}
