import '../../domain/entities/student.dart';

class StudentModel extends Student{
  StudentModel({required String id, required String name, required int age})
  :super(id: id, name:name, age:age);

  factory StudentModel.fromJson(Map<String, dynamic> json, String id) {
    return StudentModel(id: id, name: json['name'], age: json['age']);
  }

  Map<String, dynamic> toJson(){
    return{
      'name' : name,
      'age' : age,
    };
  }
}