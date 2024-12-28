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
    }
    return usersList;
  }
}
