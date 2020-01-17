import 'package:myapp/ModelClasses.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'AppLevelStaticValues.dart';

class WebServiceHelper {

  static Future<List<User>> fetchUsers() async {

    final response = await http.get(AppValues.webServiceUrl+AppValues.getUsersUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => new User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  static Future<List<Role>> getDummyRoles() async{
    Role role1 = new Role(
        id: 1,
        roleName: 'Manager'
    );
    Role role2 = new Role(
        id: 2,
        roleName: 'General Manager'
    );
    Role role3 = new Role(
        id: 3,
        roleName: 'Managing Director'
    );

    List<Role> roles = new List();
    roles.add(role1);
    roles.add(role2);
    roles.add(role3);
    return roles;
  }
}