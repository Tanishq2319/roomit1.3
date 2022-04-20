import 'package:flutter/material.dart';

import '../Sign.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
     child: Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: (Image.asset('assets/roomit.png',
            fit: BoxFit.cover,
            height:100.00,
            width:100.00
        )),

        backgroundColor: Colors.white,
        elevation: 40.0,

        leading: IconButton(icon: const Icon(Icons.menu,color: Colors.black,),
          onPressed: () {},),

        actions: [
          IconButton(onPressed: () {
            signState().signOut();
          }, icon: Icon(Icons.email,color: Colors.teal.shade700,))
        ]
      ),
       //This is for tab bar.

      body: SafeArea(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 80,
            child: Row(

              children:  const [
                Text("Hello")

              ],
            ),
          ),
          Container(
           child: const TabBar(
           labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [
            Tab(text: 'Book'),
            Tab(text: 'Rent'),
          ],
        ),
      ),



        ],
        ),
      ),
     ),
    );
  }

}
