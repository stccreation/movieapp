import 'package:flutter/material.dart';
import 'package:movieapp/homescreen.dart';

String siteurl= "http://192.168.35.150:2222";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Flix",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home:HomeScreen(),

    );
  }
}


