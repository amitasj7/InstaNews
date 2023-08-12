import 'package:flutter/material.dart';
import 'package:newsapp2/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return   MaterialApp(
      theme: ThemeData(  
        scaffoldBackgroundColor: Colors.black54,
        // primaryColor: Colors.white,
        textTheme: TextTheme(  
          // bodyText1: TextStyle(color: Colors.white),
          bodyText2:  TextStyle(color: Colors.white),
        )
      ),
    
      debugShowCheckedModeBanner: false,
      title: 'NEWS',
    

 
      home: Home(),
    );
  }
}

