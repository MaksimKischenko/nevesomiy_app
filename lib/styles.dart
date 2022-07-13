import 'package:flutter/material.dart';

class AppStyle {

  static Color appBarColor = const Color(0xff004976);
  static Color appCardColor = const Color(0xffc4a35a);
  static Color spaceColor =  Colors.white;

  static TextStyle verseTextStyle = const TextStyle(
    color: Color.fromARGB(255, 8, 8, 8),
    fontFamily: 'Pacifico', 
    fontSize: 18,
  ); 

  static TextStyle representationVerseTextStyle = const TextStyle(
    color:  Color(0xff004976),
    fontFamily: 'Pacifico', 
    fontSize: 18,
  ); 

  static TextStyle representationDrawerVerseTextStyle = const TextStyle(
    color:  Color(0xff004976),
    fontFamily: 'Pacifico', 
    fontSize: 14,
  ); 


  static TextStyle unselectedThemes = const TextStyle(
    color: Color.fromARGB(255, 8, 8, 8),
    fontFamily: 'Pacifico', 
    fontSize: 20,
  ); 

  static TextStyle selectedThemes = const TextStyle(
    color: Colors.white,
    fontFamily: 'Pacifico', 
    fontSize: 20,
  ); 

  static TextStyle headerTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Pacifico', 
    fontSize: 24
  ); 
 
}