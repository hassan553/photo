import 'package:flutter/material.dart';
import 'package:photo/screens/homeScreen.dart';
import 'package:photo/screens/photoScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
         appBarTheme:const  AppBarTheme(
           backgroundColor: Colors.yellow,
           elevation: 0.0,

           iconTheme:IconThemeData(color: Colors.black,),
         ),
primaryColor: Colors.yellow,
        accentColor: Colors.yellow,
      ),
    ),
  );
}
