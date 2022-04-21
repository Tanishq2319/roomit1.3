import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:room_it/Dev/underDev.dart';
import 'package:room_it/create_ac/sign_up.dart';
import 'package:room_it/main.dart';







class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => signState();
}

class signState extends State<sign> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
    body:  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Stack(
            children: <Widget>[
              Container(
                padding: const  EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child:  const Text("Hello",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold),),
              ),

              Container(
                padding:  const EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                child:  const Text("There",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold),),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                child: const Text(".",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold,color: Colors.green),),
              ),
            ],
          ),

          Container(
            padding:  const EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
            child: Column(
              children:  <Widget>[
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
                ),

               const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  decoration:  const InputDecoration(
                    labelText: "Password", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                ),
                  obscureText: true,
                ),

            const SizedBox(height: 20),

                Container(
                  alignment: const Alignment(1.0,0.0),
                  padding: const EdgeInsets.only(top: 15.0,left: 20.0),

                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  const develop()),
                        );
                      },
                    child: const Text("Forgot Password",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: "Montserrat",decoration: TextDecoration.underline,))
                  ),
                ),

                const SizedBox(height: 40.0),

                InkWell(
                  child: SizedBox(
                    height: 40.0,
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: const Center(
                          child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
                        )
                    ),
                  ),
                  onTap: signIn,
                ),

                const SizedBox(height: 20.0),

                InkWell(
                  child: Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Center(

                            child: Text("Log in with google",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: (){Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const  develop()),
                  );},
                ),

                const SizedBox(height: 15.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("New to Room IT ?",style: TextStyle(fontFamily: "Montserrat"),
                    ),

                    const SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      },
                      child: const Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat",decoration: TextDecoration.underline),)
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

  Future<void> signIn() async {

    showDialog(
      context: context,
      barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator(),)
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseException catch (e){
      if (kDebugMode) {
        print(e);
      }
    }
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
     );
    // hiding the dialogue
    
  //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
