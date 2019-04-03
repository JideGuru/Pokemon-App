import 'package:flutter/material.dart';
import 'package:pokemon_app/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var title = "Pokemon App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$title",
      debugShowCheckedModeBanner: false,
      home: Home(
        header: "$title",
      ),

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        accentColor: Colors.blue,
        textTheme: TextTheme(
          headline: TextStyle(
//              fontSize: 72.0,
//              fontWeight: FontWeight.bold,
          ),
          title: TextStyle(
//              fontSize: 36.0,
//              fontStyle: FontStyle.italic,
              color: Colors.black
          ),
          body1: TextStyle(
//              fontSize: 14.0,
//              fontFamily: 'Hind',
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
