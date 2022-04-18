import 'package:flutter/material.dart';

class develop extends StatefulWidget {
  const develop({Key? key}) : super(key: key);

  @override
  State<develop> createState() => _developState();
}

class _developState extends State<develop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Align(
           alignment: Alignment.topLeft,
           child: GestureDetector(
             onTap: () => Navigator.pop(context),
             child: const Icon(
               Icons.arrow_back,
               size: 32,
               color: Colors.black54,
             ),
           ),
         ),
         Container(
           child: Stack(
             children: [
               Container(
                 padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                 child: Text("< UNDER DEV ./>",style: TextStyle(fontSize: 80.0,fontWeight: FontWeight.bold),),
               ),
             ],
           ),
         )
       ],
     ),
    );
  }
}
