// Mengimpor file student.dart yang berisi definisi class Student
import '../entities/student.dart';
// Mengimpor file student_repository.dart yang berisi definisi repository untuk student
import '../repositories/student_repository.dart';

// Mendefinisikan class UpdateStudent yang bertugas untuk memperbarui data student
class UpdateStudent {
  // Variabel repository untuk mengakses method yang ada di StudentRepository
  final StudentRepository repository;

  // Constructor untuk menerima objek StudentRepository saat class ini diinisialisasi
  UpdateStudent(this.repository);

  // Fungsi call untuk memperbarui data student
  // Fungsi ini menerima objek student dan memanggil method updateStudent di repository
  Future<void> call(Student student) async {
    // Memanggil fungsi updateStudent di repository untuk memperbarui data student
    await repository.updateStudent(student);
  }
}
