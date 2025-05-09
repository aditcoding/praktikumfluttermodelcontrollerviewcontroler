// Import class entity Student dari domain
import '../../domain/entities/student.dart';

// StudentModel adalah turunan dari entity Student
class StudentModel extends Student {
  // Konstruktor StudentModel memanggil konstruktor parent (Student)
  StudentModel({required String id, required String name, required int age})
      : super(id: id, name: name, age: age);

  // Factory constructor untuk membuat instance StudentModel dari Firestore dan ID dokumen
  factory StudentModel.fromJson(Map<String, dynamic> json, String id) {
    return StudentModel(
      id: id,               // ID dokumen Firestore
      name: json['name'],   // Ambil nama dari field JSON
      age: json['age'],     // Ambil umur dari field JSON
    );
  }

  // Mengubah StudentModel menjadi Map<String, dynamic> agar bisa dikirim ke Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      // 'id' tidak disimpan karena Firestore otomatis menyediakan ID dokumen
    };
  }
}
