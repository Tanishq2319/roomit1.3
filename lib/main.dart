import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:room_it/Main%20Page/home_screen.dart';
import 'package:room_it/REGISTATION/welcome.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp( const MyApp());
}

//final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Room Innovation Time',
      //navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState)
          return Center(child: CircularProgressIndicator());

          else if (snapshot.hasError)
            return Center(child: Text("something went wrong.."));

         else if (snapshot.hasData) {
              return Home();
          }
          else {
            return Welcome();
          }
      },
      ),
    );
  }
}
