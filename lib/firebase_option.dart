import 'package:firebase_core/firebase_core.dart';
//Kelas untuk mengkonfigurasi firebase
class DefaultFirebaseOptions { //DefaultFirebaseOption digunakan untuk mengkonfigurasikan dengan firebase
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'AIzaSyDX-EO1rd9Lq058FRuPl6jVt1lhaMKSBt8', //Memuat kode APIKey yang di peroleh dari firebase
      appId: '1:493941039080:web:00ed19abedf9ae09b10e5d', //App ID dari firebase
      messagingSenderId: '493941039080', //id dari messageSender firebase
      projectId: 'praktikum-vmmc', //Project id dari firebase
      storageBucket: 'praktikum-vmmc.firebasestorage.app', //dan project firebase dalam hal ini saya kasih nama praktikum-crud
    );
  }
}