// Mengimpor package Flutter dan file student.dart
import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';

// Mendefinisikan halaman form untuk menambah atau mengedit data mahasiswa
class StudentFormPage extends StatefulWidget {
  final Student? student; // Data mahasiswa yang akan diedit, jika ada

  // Constructor untuk menerima data mahasiswa (jika ada) saat halaman ini dibuka
  const StudentFormPage({Key? key, this.student}) : super(key: key);

  @override
  _StudentFormPageState createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  // Controller untuk mengontrol teks input pada form
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
      // AppBar menampilkan judul sesuai dengan apakah data mahasiswa ada atau tidak
      appBar: AppBar(
        title: Text(widget.student == null ? 'Tambah Mahasiswa' : 'Edit Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field untuk Nama
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            // Input field untuk Usia
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Usia'),
              keyboardType: TextInputType.number, // Membatasi input hanya angka
            ),
            SizedBox(height: 20),
            // Tombol untuk menambah atau menyimpan data mahasiswa
            ElevatedButton(
              onPressed: () {
                // Mengambil data dari form
                final name = _nameController.text;
                final age = int.tryParse(_ageController.text) ?? 0;
                // Membuat objek Student baru atau mengupdate yang lama
                final student = Student(id: widget.student?.id ?? '', name: name, age: age);

                // Mengirim data mahasiswa kembali ke halaman sebelumnya
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
