

import 'package:flutter/material.dart';
import 'package:movieapp/movie_screen/movie_screen.dart';
import 'package:movieapp/search_screen/search_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _counterinex=0;
  List pages=const[MovieScreen(),SearchScreen()];
 
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        title: const Text("Movie Flix",style: TextStyle(color: Colors.white),),
      ),
      body: pages[_counterinex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        items: const [
         BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
                )
              ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            activeIcon: Icon(
              Icons.search,
              color: Colors.red,
                )
              )
        ],
        currentIndex: _counterinex,
        onTap: (index) {
          setState(() {
            _counterinex=index;
          });
        },
      ),
    );
    

  }
}




