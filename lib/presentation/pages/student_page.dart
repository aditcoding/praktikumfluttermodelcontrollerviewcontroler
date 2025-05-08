import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/student.dart';
import '../../domain/usecase/get_students.dart';
import '../../domain/usecase/add_student.dart';
import '../../domain/usecase/update_student.dart';
import '../../domain/usecase/delete_student.dart';
import 'student_form_page.dart';
import '../provider/student_viewmodel.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StudentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: vm.students.length,
        itemBuilder: (context, index) {
          final student = vm.students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('Usia: ${student.age}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    // Pindah ke halaman edit mahasiswa
                    final updatedStudent = await Navigator.push<Student>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentFormPage(student: student),
                      ),
                    );
                    if (updatedStudent != null) {
                      vm.updateStudentInList(updatedStudent);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => vm.deleteStudentFromList(student.id),
                ),
              ],
            ),
          );
        },
      ),
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
          if (newStudent != null) {
            vm.addStudentToList(newStudent);
          }
        },
      ),
    );
  }
}
