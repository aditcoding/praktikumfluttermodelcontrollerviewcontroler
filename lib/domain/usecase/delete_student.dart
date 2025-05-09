// Import interface repository
import '../repositories/student_repository.dart';

// Use case untuk menghapus siswa berdasarkan ID
class DeleteStudent {
  // Repository yang dipakai untuk akses data
  final StudentRepository repository;

  // Konstruktor menerima repository (dependency injection)
  DeleteStudent(this.repository);

  // Fungsi utama yang dipanggil untuk menghapus siswa
  Future<void> call(String id) async {
    await repository.deleteStudent(id); // Hapus data siswa berdasarkan ID lewat repository
  }
}
