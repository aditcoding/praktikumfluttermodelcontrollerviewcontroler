// Import Firestore dari Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Import entitas Student dari domain
import '../../domain/entities/student.dart';

// Import interface repository dari domain
import '../../domain/repositories/student_repository.dart';

// Implementasi dari StudentRepository yang bekerja dengan Firebase
class StudentRepositoryImpl implements StudentRepository {
  // Referensi ke koleksi 'students' di Firestore
  final CollectionReference studentsRef =
  FirebaseFirestore.instance.collection('students');

  // Ambil semua data siswa dari Firestore
  @override
  Future<List<Student>> getStudents() async {
    final snapshot = await studentsRef.get(); // Ambil semua dokumen
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>; // Ambil data dalam bentuk Map
      return Student(
        id: doc.id,               // ID dokumen Firestore
        name: data['name'] ?? '', // Ambil nama, jika null kasih string kosong
        age: data['age'] ?? 0,    // Ambil umur, jika null kasih 0
      );
    }).toList(); // Ubah ke List<Student>
  }

  // Tambah siswa baru ke Firestore
  @override
  Future<void> addStudent(Student student) async {
    await studentsRef.add({
      'name': student.name,
      'age': student.age,
    });
  }

  // Update data siswa di Firestore berdasarkan ID
  @override
  Future<void> updateStudent(Student student) async {
    await studentsRef.doc(student.id).update({
      'name': student.name,
      'age': student.age,
    });
  }

  // Hapus data siswa berdasarkan ID
  @override
  Future<void> deleteStudent(String id) async {
    await studentsRef.doc(id).delete();
  }
}
