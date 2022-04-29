import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:room_it/Main%20Page/menu_bar/notification.dart';
import 'package:room_it/Main%20Page/menu_bar/rent.dart';
import 'package:room_it/Main%20Page/menu_bar/setting.dart';

import '../../security_page/auth.dart';
import 'agreement.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {

    final name = "Room IT";
    final email = "wecreate12345@roomit.com";
    final Image = "assets/unnamed.png";
    return Drawer(
      child: Material(
        color: Colors.blueGrey[400],
        child: ListView(

          children: <Widget>[

            buildHeader(
              Image: Image,
              name: name,
              email: email,


            ),
            const SizedBox(height: 48),

            Container(
                padding: padding,
                child: buildSearchField()),

            const SizedBox(height: 48),

            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: "Rent",
                    icon: Icons.apartment,
                    onClicked: () => selectedItem(context,0),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: "Notification",
                    icon: Icons.notifications,
                    onClicked: () => selectedItem(context,1),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: "Agreement",
                    icon: Icons.pages,
                    onClicked: () => selectedItem(context,2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Divider(color: Colors.white70,),

            const SizedBox(height: 30),

            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: "Setting",
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context,3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: "Log Out",
                    icon: Icons.logout,
                    onClicked: () {
                      AuthController.authInstance.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget buildHeader(
       {
         required String Image,
         required String name,
         required String email,
       }
       )
   => InkWell(
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(

            children: [
              CircleAvatar(radius: 27,backgroundImage: AssetImage(Image)),
             const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 10,color: Colors.white),
                  ),
                ],
              ),

               const Spacer(),
               const CircleAvatar(

                radius: 20,
                 backgroundColor: Colors.blueGrey,
                 child: Icon(Icons.add_comment_outlined, color: Colors.white),
               )

            ],
          ),
        ),
      );


  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }


  Widget buildMenuItem(
  {
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }



  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Rent(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => notification(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Agreement(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Setting(),
        ));
        break;



    }

  }

}


