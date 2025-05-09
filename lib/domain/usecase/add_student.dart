// Import entitas Student dari domain
import '../entities/student.dart';

// Import interface repository
import '../repositories/student_repository.dart';

// Use case untuk menambahkan siswa baru
class AddStudent {
  // Repository yang akan digunakan untuk menjalankan logika
  final StudentRepository repository;

  // Konstruktor menerima repository
  AddStudent(this.repository);

  // Fungsi utama yang akan dipanggil dari UI atau ViewModel
  Future<void> call(Student student) async {
    await repository.addStudent(student); // Tambahkan data siswa lewat repository
  }
}
