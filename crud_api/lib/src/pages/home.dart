import 'package:flutter/material.dart';

// Components
import 'package:crud_api/src/components/list.dart';
import 'package:crud_api/src/components/buttons/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: const MyCustomList(),
      floatingActionButton: const MyCustomButton(),
    );
  }
}
