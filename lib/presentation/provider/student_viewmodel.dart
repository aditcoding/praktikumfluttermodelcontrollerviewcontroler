import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';
import '../../domain/usecase/get_students.dart';
import '../../domain/usecase/add_student.dart';
import '../../domain/usecase/update_student.dart';
import '../../domain/usecase/delete_student.dart';

class StudentViewModel with ChangeNotifier {
  final GetStudents getStudents;
  final AddStudent addStudent;
  final UpdateStudent updateStudent;
  final DeleteStudent deleteStudent;

  List<Student> students = [];

  StudentViewModel({
    required this.getStudents,
    required this.addStudent,
    required this.updateStudent,
    required this.deleteStudent,
  });

  Future<void> fetchStudents() async {
    students = await getStudents();
    notifyListeners();
  }

  Future<void> addStudentToList(Student student) async {
    await addStudent(student);
    await fetchStudents();
  }

  Future<void> updateStudentInList(Student student) async {
    await updateStudent(student);
    await fetchStudents();
  }

  Future<void> deleteStudentFromList(String id) async {
    await deleteStudent(id);
    await fetchStudents();
  }
}
