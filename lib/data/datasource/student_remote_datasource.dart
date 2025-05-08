import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student_model.dart';

class StudentRemoteDatasource {
  final collection = FirebaseFirestore.instance.collection('students');

  Future<List<StudentModel>> getStudents() async {
    final snapshot = await collection.get();
    return snapshot.docs
        .map((doc) => StudentModel.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addStudent(StudentModel student) async {
    await collection.add(student.toJson());
  }

  Future<void> updateStudent(StudentModel student) async {
    await collection.doc(student.id).update(student.toJson());
  }

  Future<void> deleteStudent(String id) async {
    await collection.doc(id).delete();
  }
}
