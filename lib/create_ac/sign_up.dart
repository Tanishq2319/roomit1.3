import 'package:flutter/material.dart';
import 'package:room_it/Sign.dart';



class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Stack(
              children: <Widget>[
                Container(
                  padding: const  EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child:  const Text("Welcome To",style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.bold),),
                ),


                Container(
                  padding: const  EdgeInsets.fromLTRB(6.0, 180.0, 0.0, 0.0),
                  child:  const Text(" Room IT",style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.bold ),),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(192.0, 180.0, 0.0, 0.0),
                  child: const Text(".",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold,color: Colors.green),),
                ),
              ],
            ),

            Container(
              padding:  const EdgeInsets.only(top: 35.0,left: 20.0,right: 20.0),
              child: Column(
                children:  <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                        labelText: "Email", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                    ),
                  ),

                  const SizedBox(height: 20),

                 const TextField(
                    decoration:  InputDecoration(
                        labelText: "Password", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),

                  const TextField(
                    decoration:  InputDecoration(
                        labelText: "Confirm Password", labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                    ),
                    obscureText: true,
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
                            child: Text("SignUp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
                          )
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have a account ?",style: TextStyle(fontFamily: "Montserrat"),
                      ),

                      const SizedBox(width: 5.0),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const sign()),
                            );
                          },
                          child: const Text("LogIn",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat",decoration: TextDecoration.underline),)
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
}
