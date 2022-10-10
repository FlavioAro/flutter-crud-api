import 'package:flutter/material.dart';

// API
import 'package:crud_api/src/services/http.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final messageController = TextEditingController();
  HttpResponse httpResponse = HttpResponse();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      firstNameController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      lastNameController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      messageController.text = args[3];
    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.popAndPushNamed(context, 'home');
          }, // <-- SEE HERE
        ),
        centerTitle: true,
        title: const Text('Update'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'Message',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                bool response = await httpResponse.updateData(
                    args[0],
                    firstNameController.text,
                    lastNameController.text,
                    messageController.text);

                if (response) {
                  Navigator.popAndPushNamed(context, 'home');
                } else {
                  throw Exception('Failed to update data.');
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
