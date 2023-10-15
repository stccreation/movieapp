

import 'package:flutter/material.dart';

class FilelistView extends StatefulWidget {
  const FilelistView({super.key});

  @override
  State<FilelistView> createState() => _FilelistViewState();
}

class _FilelistViewState extends State<FilelistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:15,
          
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                
                width: 200,
                color: Colors.white,
              ),
            );
          },
          ),
      ),
    );
  }
}