import 'package:flutter/material.dart';

// Pages
import 'package:crud_api/src/pages/home.dart';
import 'package:crud_api/src/pages/create.dart';
import 'package:crud_api/src/pages/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        'home': (context) => const HomePage(),
        'create': (context) => const CreatePage(),
        'update': (context) => const UpdatePage(),
      },
    );
  }
}
