// Import entitas Student
import '../entities/student.dart';

// Import interface repository
import '../repositories/student_repository.dart';

// Use case untuk mengambil daftar semua siswa
class GetStudents {
  // Repository yang digunakan untuk ambil data siswa
  final StudentRepository repository;

  // Konstruktor menerima repository (dependency injection)
  GetStudents(this.repository);

  // Fungsi utama untuk mengambil semua siswa
  Future<List<Student>> call() async {
    return await repository.getStudents(); // Panggil method dari repository
  }
}
