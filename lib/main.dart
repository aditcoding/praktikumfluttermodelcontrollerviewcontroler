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

Future<void> main() async {
  // Setup repository dan usecases
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //Ini di gunakan untuk inisialisasi kelas DefaultFirebaseOption
  );
  final repository = StudentRepositoryImpl();

  runApp(
    ChangeNotifierProvider(
      create: (_) => StudentViewModel(
        getStudents: GetStudents(repository),
        addStudent: AddStudent(repository),
        updateStudent: UpdateStudent(repository),
        deleteStudent: DeleteStudent(repository),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentPage(),
    );
  }
}