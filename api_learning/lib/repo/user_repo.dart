// features/user_list/repository/user_repository.dart
import 'dart:convert';

import 'package:api_learning/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> fetchUsers() async {
    List<User> usersList = [];
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List<dynamic> responseDict = json.decode(response.body);
    for(final eachDict in responseDict) {
      usersList.add(User.fromJson(eachDict));
      // usersList.add(User(id: int.parse(eachDict['id'] ?? '0'), name: eachDict['name'] ?? '', email: eachDict['email'] ?? ''));
    }
    return usersList;

    // // Simulating API call
    // await Future.delayed(const Duration(seconds: 1));
    // return [
    //   User(id: 1, name: "John Doe", email: "john@example.com"),
    //   User(id: 2, name: "Jane Smith", email: "jane@example.com"),
    //   User(id: 3, name: "Robert Brown", email: "robert@example.com"),
    // ];
  }
}
