import 'package:flutter/material.dart';
import 'package:adaapp/splash/screens/Login_page.dart';
import 'package:adaapp/Home/screens/Home_Page.dart';
import 'package:adaapp/Category/screens/Category_Page.dart';
import 'package:adaapp/add/screens/add_page.dart';
import 'package:adaapp/mypage/screens/MyPage_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}

class Adaapp extends StatefulWidget {
  const Adaapp({super.key});

  @override
  State<Adaapp> createState() => _AdaappState();
}

class _AdaappState extends State<Adaapp> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(initialCategory: '전체'),
    AddPage(),
    Center(child: Text('채팅')),
    MypagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
                fontWeight: .bold,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}