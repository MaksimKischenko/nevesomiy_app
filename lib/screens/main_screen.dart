import 'package:flutter/material.dart';
import 'package:nevesomiy_app/screens/screens.dart';
import 'package:nevesomiy_app/styles.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({ Key? key }) : super(key: key);

  @override
  State<MainAppScreen> createState() => MainAppScreenState();
}

class MainAppScreenState extends State<MainAppScreen> {

  static final List<Widget> screensTabs = [
    const ThemesScreen(),
    const RepresentationScreen(),
    const BookInfoScreen()
  ];

  int selectedBottomNavigationIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
           Expanded(
            child: screensTabs[selectedBottomNavigationIndex]
          ),
          BottomNavigationBar(
            enableFeedback: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info_rounded),
                label: 'Об авторе',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.short_text_rounded),
                label: 'Стихи',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Книги',
              ),
            ],
            currentIndex: selectedBottomNavigationIndex,
            selectedItemColor: AppStyle.appBarColor,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedBottomNavigationIndex = index;
    });
  }
}