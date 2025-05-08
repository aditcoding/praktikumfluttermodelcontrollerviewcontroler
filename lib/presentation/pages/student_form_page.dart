import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';

class StudentFormPage extends StatefulWidget {
  final Student? student; // Data mahasiswa yang akan diedit, jika ada

  const StudentFormPage({Key? key, this.student}) : super(key: key);

  @override
  _StudentFormPageState createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Jika ada data mahasiswa yang diedit, isi form dengan data tersebut
    if (widget.student != null) {
      _nameController.text = widget.student!.name;
      _ageController.text = widget.student!.age.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Tambah Mahasiswa' : 'Edit Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Usia'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final age = int.tryParse(_ageController.text) ?? 0;
                final student = Student(id: widget.student?.id ?? '', name: name, age: age);

                // Panggil callback untuk simpan data
                Navigator.pop(context, student);
              },
              child: Text(widget.student == null ? 'Tambah' : 'Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
