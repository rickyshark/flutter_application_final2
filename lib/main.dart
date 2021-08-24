import 'package:flutter/material.dart';

// import 'page/home_page.dart';
import 'page/login_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Utesa',
      theme: ThemeData(primaryColor: Colors.amber, accentColor: Colors.green),
      home: LoginPage(),
    );
  }
}
