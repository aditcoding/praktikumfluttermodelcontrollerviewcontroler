// lib/infrastructure/repositories/student_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  final CollectionReference studentsRef =
  FirebaseFirestore.instance.collection('students');

  @override
  Future<List<Student>> getStudents() async {
    final snapshot = await studentsRef.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Student(
        id: doc.id,
        name: data['name'] ?? '',
        age: data['age'] ?? 0,
      );
    }).toList();
  }

  @override
  Future<void> addStudent(Student student) async {
    await studentsRef.add({
      'name': student.name,
      'age': student.age,
    });
  }

  @override
  Future<void> updateStudent(Student student) async {
    await studentsRef.doc(student.id).update({
      'name': student.name,
      'age': student.age,
    });
  }

  @override
  Future<void> deleteStudent(String id) async {
    await studentsRef.doc(id).delete();
  }
}
