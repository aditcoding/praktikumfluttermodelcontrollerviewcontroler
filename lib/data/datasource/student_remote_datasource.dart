// Import pustaka Firestore dari Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Import model StudentModel dari folder models
import '../models/student_model.dart';

// Class ini bertanggung jawab untuk mengakses data student dari Firebase Firestore
class StudentRemoteDatasource {
  // Referensi ke koleksi 'students' di Firestore
  final collection = FirebaseFirestore.instance.collection('students');

  // Fungsi untuk mengambil seluruh data siswa dari koleksi 'students'
  Future<List<StudentModel>> getStudents() async {
    // Ambil seluruh dokumen dalam koleksi
    final snapshot = await collection.get();

    // Ubah setiap dokumen menjadi objek StudentModel dan kembalikan sebagai List
    return snapshot.docs
        .map((doc) => StudentModel.fromJson(doc.data(), doc.id))
        .toList();
  }

  // Fungsi untuk menambahkan data siswa baru ke koleksi
  Future<void> addStudent(StudentModel student) async {
    // Tambahkan data siswa ke Firestore dengan konversi ke format JSON
    await collection.add(student.toJson());
  }

  // Fungsi untuk memperbarui data siswa yang sudah ada berdasarkan ID
  Future<void> updateStudent(StudentModel student) async {
    // Akses dokumen berdasarkan ID, lalu update dengan data baru
    await collection.doc(student.id).update(student.toJson());
  }

  // Fungsi untuk menghapus data siswa berdasarkan ID
  Future<void> deleteStudent(String id) async {
    // Hapus dokumen dari Firestore berdasarkan ID
    await collection.doc(id).delete();
  }
}
