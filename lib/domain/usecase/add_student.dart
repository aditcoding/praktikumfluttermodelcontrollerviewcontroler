import '../entities/student.dart';
import '../repositories/student_repository.dart';

class AddStudent {
  final StudentRepository repository;

  AddStudent(this.repository);

  Future<void> call(Student student) async {
    await repository.addStudent(student);
  }
}
