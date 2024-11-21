import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/detail_screen.dart';
import 'package:wisata_candi/favorite_screen.dart';
import 'package:wisata_candi/home_screen.dart';
import 'package:wisata_candi/profilescreen.dart';
import 'package:wisata_candi/search_screen.dart';
import 'package:wisata_candi/sign_up_screen.dart';
import 'package:wisata_candi/signin_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Candi",
      // home: DetailScreen(
      //   candi: candiList[0],
      // ),
      home: SignUpScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 1. Deklarasikan Variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    Profilescreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. Buat property body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // 3. Buat property bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 51, 84, 55)
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.grey,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.grey,), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.grey,), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person_2, color: Colors.grey,), label: 'Profile'),
          ],
          selectedItemColor: const Color.fromARGB(255, 218, 218, 218),
          unselectedLabelStyle: TextStyle(fontFamily: 'Cascadia'),
          selectedLabelStyle: TextStyle(fontFamily: 'Cascadia'),
          selectedFontSize: 20,
          showUnselectedLabels: true,
        ),
      ),
      // 3. Buat data dari child dari Theme
    );
  }
}