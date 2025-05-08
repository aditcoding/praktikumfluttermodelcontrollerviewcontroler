// lib/domain/repositories/student_repository.dart

import '../entities/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();
  Future<void> addStudent(Student student);
  Future<void> updateStudent(Student student);
  Future<void> deleteStudent(String id);
}
