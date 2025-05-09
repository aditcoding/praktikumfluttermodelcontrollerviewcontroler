// Class entity Student, mewakili data siswa di lapisan domain (bersih dari logika eksternal)
class Student {
  // Properti final (immutable): id, name, dan age
  final String id;
  final String name;
  final int age;

  // Konstruktor utama dengan parameter wajib
  Student({required this.id, required this.name, required this.age});

  // Method untuk menyalin objek Student dengan perubahan sebagian (optional)
  Student copyWith({String? id, String? name, int? age}) {
    return Student(
      id: id ?? this.id,       // Jika parameter tidak null, pakai itu, kalau tidak pakai yang lama
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
