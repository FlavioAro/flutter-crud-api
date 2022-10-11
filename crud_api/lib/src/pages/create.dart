import 'package:flutter/material.dart';
import 'package:crud_api/src/data/services/api.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final messageController = TextEditingController();
  HttpResponse httpResponse = HttpResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.popAndPushNamed(context, 'home');
          }, // <-- SEE HERE
        ),
        centerTitle: true,
        title: const Text('Create Data'),
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
                      bool response = await httpResponse.createData(
                          firstNameController.text,
                          lastNameController.text,
                          messageController.text);

                      if (response) {
                        Navigator.popAndPushNamed(context, 'home');
                      } else {
                        throw Exception('Failed to create data.');
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
                    child: const Text('Submit'),
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
