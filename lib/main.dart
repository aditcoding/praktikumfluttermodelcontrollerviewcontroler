// Mengimpor package yang diperlukan untuk Firebase, Flutter, dan Provider
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/repositories/student_repository.dart';
import 'firebase_option.dart';
import 'domain/entities/student.dart';
import 'data/repositories/student_repository_impl.dart';
import 'presentation/provider/student_viewmodel.dart';
import 'domain/usecase/add_student.dart';
import 'domain/usecase/delete_student.dart';
import 'domain/usecase/get_students.dart';
import 'domain/usecase/update_student.dart';
import 'presentation/pages/student_page.dart';

// Fungsi main untuk menjalankan aplikasi
Future<void> main() async {
  // Menunggu agar widget binding selesai dan Firebase dapat diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase dengan konfigurasi platform saat ini
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Menyediakan pengaturan default Firebase untuk platform saat ini
  );

  // Membuat instance repository untuk akses data mahasiswa
  final repository = StudentRepositoryImpl();

  // Menjalankan aplikasi dengan menggunakan ChangeNotifierProvider untuk menyediakan StudentViewModel
  runApp(
    ChangeNotifierProvider(
      create: (_) => StudentViewModel(
        getStudents: GetStudents(repository),  // Menyediakan use case untuk mendapatkan mahasiswa
        addStudent: AddStudent(repository),    // Menyediakan use case untuk menambah mahasiswa
        updateStudent: UpdateStudent(repository), // Menyediakan use case untuk memperbarui mahasiswa
        deleteStudent: DeleteStudent(repository), // Menyediakan use case untuk menghapus mahasiswa
      ),
      child: MyApp(), // Menjalankan aplikasi utama
    ),
  );
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',  // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema warna biru untuk aplikasi
      ),
      home: StudentPage(), // Halaman utama aplikasi yang menampilkan daftar mahasiswa
    );
  }
}
