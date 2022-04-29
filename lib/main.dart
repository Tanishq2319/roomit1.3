import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_it/security_page/auth.dart';
import 'package:room_it/security_page/fireauth.dart';
import 'package:room_it/security_page/sign_in.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  firebaseInitialization.then((value)
  {
    Get.put(AuthController());
  });
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setState(() { });
  }
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Room Innovation Time',
      debugShowCheckedModeBanner: false,
      home: Sign(),
    );
  }
}