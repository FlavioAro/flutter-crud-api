import 'package:flutter/material.dart';
import 'package:crud_api/src/services/http.dart';
import 'package:crud_api/src/data/person.dart';

class MyCustomButton extends StatefulWidget {
  const MyCustomButton({Key? key}) : super(key: key);

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  HttpResponse httpResponse = HttpResponse();
  List<Person> listPerson = [];

  getData() async {
    listPerson = await httpResponse.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.popAndPushNamed(context, 'create');
      },
      child: const Icon(Icons.add),
    );
  }
}
