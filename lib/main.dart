import 'pages/add_account.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'models/account_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: "Helvetica",
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          headline6: TextStyle(fontSize: 22),
          bodyText1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            fontFamily: "Hind",
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: HomePage(
        accountInfo: "",
      ),
    );
  }

  ThemeData _customTheme(BuildContext context) {
    return ThemeData(
      accentColor: Colors.yellow,
    );
  }
}
