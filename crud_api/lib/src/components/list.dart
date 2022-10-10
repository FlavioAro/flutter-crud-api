import 'package:flutter/material.dart';
import 'package:crud_api/src/services/http.dart';
import 'package:crud_api/src/data/person.dart';

class MyCustomList extends StatefulWidget {
  const MyCustomList({Key? key}) : super(key: key);

  @override
  State<MyCustomList> createState() => _MyCustomListState();
}

class _MyCustomListState extends State<MyCustomList> {
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
    return ListView.builder(
      itemCount: listPerson.length,
      itemBuilder: ((context, index) {
        Person person = listPerson[index];
        return InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, 'update', arguments: [
              person.id,
              person.firstName,
              person.lastName,
              person.message
            ]);
          },
          child: Dismissible(
            key: Key(person.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Data'),
                    content: const Text('Are you sure to delete data?'),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            bool response =
                                await httpResponse.deleteData(person.id);

                            if (response) {
                              Navigator.pop(context, true);
                            } else {
                              Navigator.pop(context, false);
                            }
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('No'))
                    ],
                  );
                },
              );
            },
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('lib/src/assets/person.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text('${person.firstName} ${person.lastName}'),
              subtitle: Text(
                person.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      }),
    );
  }
}
