import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:room_it/Main%20Page/home_screen.dart';
import 'package:room_it/create_ac/sign_up.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

//final navigatorKey = GlobalKey<NavigatorState>();

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
    return const MaterialApp(
      title: 'Room Innovation Time',
      //navigatorKey: navigatorkey(),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState) {
            return const Center(child: CircularProgressIndicator());
            //return const Center(child: Text("entre the data..."));
          } else if (snapshot.hasError) {
            return const Center(child: Text("something went wrong.."));
          } else if (snapshot.hasData) {
              // signState().signOut();
              // signState().signIn();
              //return const Home();
              return const Home();
          }
          else {
            return const Signup();
          }
      },
      ),
    );
  }
}
