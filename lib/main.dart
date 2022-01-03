import 'package:flutter/material.dart';
import 'news/ui/news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}
