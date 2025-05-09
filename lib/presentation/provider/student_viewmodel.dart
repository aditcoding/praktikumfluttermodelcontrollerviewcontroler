// Mengimpor package Flutter dan use case terkait mahasiswa
import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';
import '../../domain/usecase/get_students.dart';
import '../../domain/usecase/add_student.dart';
import '../../domain/usecase/update_student.dart';
import '../../domain/usecase/delete_student.dart';

// ViewModel untuk mengelola data mahasiswa
class StudentViewModel with ChangeNotifier {
  // Menyimpan referensi ke use case yang menangani operasi mahasiswa
  final GetStudents getStudents;
  final AddStudent addStudent;
  final UpdateStudent updateStudent;
  final DeleteStudent deleteStudent;

  // Daftar mahasiswa yang akan ditampilkan di UI
  List<Student> students = [];

  // Constructor untuk menginisialisasi ViewModel dengan dependensi yang diperlukan
  StudentViewModel({
    required this.getStudents,
    required this.addStudent,
    required this.updateStudent,
    required this.deleteStudent,
  });

  // Fungsi untuk mengambil daftar mahasiswa dari use case dan memperbarui UI
  Future<void> fetchStudents() async {
    students = await getStudents(); // Memanggil use case untuk mendapatkan data mahasiswa
    notifyListeners(); // Memberitahu listener (UI) untuk memperbarui tampilan
  }

  // Fungsi untuk menambah mahasiswa ke dalam daftar
  Future<void> addStudentToList(Student student) async {
    await addStudent(student); // Menambahkan mahasiswa dengan memanggil use case
    await fetchStudents(); // Mengambil ulang daftar mahasiswa setelah penambahan
  }

  // Fungsi untuk memperbarui data mahasiswa dalam daftar
  Future<void> updateStudentInList(Student student) async {
    await updateStudent(student); // Memperbarui mahasiswa dengan memanggil use case
    await fetchStudents(); // Mengambil ulang daftar mahasiswa setelah pembaruan
  }

  // Fungsi untuk menghapus mahasiswa dari daftar
  Future<void> deleteStudentFromList(String id) async {
    await deleteStudent(id); // Menghapus mahasiswa dengan memanggil use case
    await fetchStudents(); // Mengambil ulang daftar mahasiswa setelah penghapusan
  }
}
