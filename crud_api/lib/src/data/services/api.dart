import 'package:http/http.dart' as http;
import 'package:crud_api/src/data/models/person.dart';
import 'dart:convert';

class HttpResponse {
  String uri = 'https://63403f2ae44b83bc73cca5b7.mockapi.io/person';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Person> person = it.map((e) => Person.fromJson(e)).toList();
        return person;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future createData(String firstName, String lastName, String message) async {
    try {
      final response = await http.post(Uri.parse(uri), body: {
        'first_name': firstName,
        'last_name': lastName,
        'message': message
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future updateData(
      String id, String firstName, String lastName, String message) async {
    try {
      final response = await http.put(Uri.parse('$uri/$id'), body: {
        'first_name': firstName,
        'last_name': lastName,
        'message': message
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse('$uri/$id'));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
