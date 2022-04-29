
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:room_it/Main%20Page/Gnav/location.dart';
import 'Gnav/favorite.dart';
import 'Gnav/home_page.dart';
import 'Gnav/payment.dart';
import 'menu_bar/menu.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final screen = [
    const HomePage(),
    const Favorite(),
    const Payment(),
    const location(),
  ];



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const MenuBar(),
      body: screen[index],
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,

        selectedIndex: index,
        onTabChange: (index) =>
        setState(() => this.index = index),

        color: Colors.black,
        activeColor: Colors.white,
        tabBackgroundColor : Colors.blueGrey,
        gap: 8,

        padding: const EdgeInsets.all(16),
        tabs:const [
          GButton(icon: Icons.home, text: "Home",),

          GButton(icon: Icons.favorite, text: "Favourite",),

          GButton(icon: Icons.payment, text: "Pay Rent",),

          GButton(icon: Icons.location_on, text: "Nearby",),
        ],
      ),

      appBar: AppBar(
        centerTitle: true,
         title: (Image.asset('assets/roomit.png',
             fit: BoxFit.cover,
             height:100.00,
              width:100.00
      )),
        backgroundColor: Colors.blueGrey[600],
        elevation: 40.0,
       actions: [
            IconButton(
             icon: const Icon(Icons.more_vert,color: Colors.white), onPressed: () {},)
          ]
        ),
    );
  }
}







