// Mengimpor package Flutter, provider, dan file terkait mahasiswa
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/student.dart';
import '../../domain/usecase/get_students.dart';
import '../../domain/usecase/add_student.dart';
import '../../domain/usecase/update_student.dart';
import '../../domain/usecase/delete_student.dart';
import 'student_form_page.dart';
import '../provider/student_viewmodel.dart';

// Halaman untuk menampilkan daftar mahasiswa
class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengakses ViewModel yang mengelola data mahasiswa
    final vm = Provider.of<StudentViewModel>(context);

    return Scaffold(
      // AppBar dengan judul halaman
      appBar: AppBar(
        title: Text('Daftar Mahasiswa'),
      ),
      // Menampilkan daftar mahasiswa menggunakan ListView
      body: ListView.builder(
        itemCount: vm.students.length, // Jumlah mahasiswa yang ada
        itemBuilder: (context, index) {
          final student = vm.students[index]; // Mendapatkan mahasiswa dari list
          return ListTile(
            title: Text(student.name), // Menampilkan nama mahasiswa
            subtitle: Text('Usia: ${student.age}'), // Menampilkan usia mahasiswa
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tombol untuk mengedit data mahasiswa
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    // Pindah ke halaman form untuk mengedit mahasiswa
                    final updatedStudent = await Navigator.push<Student>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentFormPage(student: student),
                      ),
                    );
                    // Jika mahasiswa berhasil diperbarui, update data di list
                    if (updatedStudent != null) {
                      vm.updateStudentInList(updatedStudent);
                    }
                  },
                ),
                // Tombol untuk menghapus mahasiswa
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => vm.deleteStudentFromList(student.id),
                ),
              ],
            ),
          );
        },
      ),
      // Tombol untuk menambah mahasiswa baru
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // Pindah ke halaman form untuk menambah mahasiswa baru
          final newStudent = await Navigator.push<Student>(
            context,
            MaterialPageRoute(
              builder: (context) => StudentFormPage(),
            ),
          );
          // Jika mahasiswa baru berhasil ditambahkan, update data di list
          if (newStudent != null) {
            vm.addStudentToList(newStudent);
          }
        },
      ),
    );
  }
}
