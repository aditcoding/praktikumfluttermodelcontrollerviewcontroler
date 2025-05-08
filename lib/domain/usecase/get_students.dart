import '../entities/student.dart';
import '../repositories/student_repository.dart';

class GetStudents {
  final StudentRepository repository;

  GetStudents(this.repository);

  Future<List<Student>> call() async {
    return await repository.getStudents();
  }
}
