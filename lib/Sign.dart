import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:room_it/Dev/underDev.dart';
import 'package:room_it/Main%20Page/home_screen.dart';
import 'package:room_it/main.dart';

import 'REGISTATION/register.dart';




class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }


  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text("Hello",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold),),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                child: Text("There",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold),),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                child: Text(".",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold,color: Colors.green),),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
          child: Column(
            children:  <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
              ),
                obscureText: true,
              ),

          SizedBox(height: 20),

              Container(
                alignment: Alignment(1.0,0.0),
                padding: EdgeInsets.only(top: 15.0,left: 20.0),

                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  develop()),
                      );
                    },
                  child: Text("Frogot Password",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: "Montserrat",decoration: TextDecoration.underline,))
                ),
              ),

              SizedBox(height: 40.0),

              InkWell(
                child: Container(
                  height: 40.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: Center(
                        child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
                      )
                  ),
                ),
                onTap: signIn,
              ),

              SizedBox(height: 20.0),

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
                      children: <Widget>[
                        Center(

                          child: Text("Log in with google",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: (){Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  develop()),
                );},
              ),

              SizedBox(height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New to Room IT ?",style: TextStyle(fontFamily: "Montserrat"),
                  ),

                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  Register()),
                      );
                    },
                    child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat",decoration: TextDecoration.underline),)
                  ),
                ],
              )

            ],
          ),
        ),
      ],
    ),
    );
  }

  Future signIn() async {

    showDialog(
      context: context,
      barrierDismissible: false,
    builder: (context) => Center(child: CircularProgressIndicator(),)
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseException catch (e){
      print(e);
    }
    // hiding the dialogue
    
  //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
