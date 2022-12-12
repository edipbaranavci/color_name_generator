import 'package:flutter/material.dart';

import 'features/home/home_page/view/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
      ),
      home: const HomePageView(),
    );
  }
}
