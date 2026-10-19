import 'package:campusflow_models/campusflow_models.dart';

Future<void> main() async {
  const repo = FakeRepository();

  print('Chargement...');
  final user = await repo.fetchUser();
  final courses = await repo.fetchCourses();
  final tasks = await repo.fetchTasks();

  print(user);
  courses.forEach(print);
  tasks.forEach(print);

  final done = tasks.first.copyWith(isDone: true);
  print('Après copyWith : $done');
}
