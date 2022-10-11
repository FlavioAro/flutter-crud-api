import 'package:flutter/material.dart';
import 'package:crud_api/src/data/services/api.dart';

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
          },
        ),
        centerTitle: true,
        title: const Text('Update Data'),
        backgroundColor: Colors.deepPurple[300],
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple[300]),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20)),
                    ),
                    child: const Text('Update'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
