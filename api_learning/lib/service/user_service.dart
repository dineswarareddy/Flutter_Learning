import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  const UserService();

  Future<dynamic> fetchUsersData() async {
    dynamic responseJson;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    return response;
  }

  dynamic _processResponse(http.Response apiResponse) {
   switch(apiResponse.statusCode) {
    case 200:
      return jsonDecode(apiResponse.body);
    default:

   }

  }
}