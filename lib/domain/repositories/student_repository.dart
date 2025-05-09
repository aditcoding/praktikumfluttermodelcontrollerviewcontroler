// Import entitas Student dari domain
import '../entities/student.dart';

// Interface (abstraksi) untuk repository Student
abstract class StudentRepository {
  // Ambil daftar semua siswa
  Future<List<Student>> getStudents();

  // Tambah siswa baru
  Future<void> addStudent(Student student);

  // Update data siswa
  Future<void> updateStudent(Student student);

  // Hapus siswa berdasarkan ID
  Future<void> deleteStudent(String id);
}
