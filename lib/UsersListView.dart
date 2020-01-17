import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class User {
  final String id;
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final bool isAdmin;
  final String createdAt;
  final String updatedAt;


  User({this.id, this.userName, this.password, this.firstName,this.lastName,this.isAdmin,this.createdAt,this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      isAdmin: json['isAdmin']
    );
  }
}

class UsersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<User> data = snapshot.data;
          return _usersListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<User>> _fetchJobs() async {

    final usersListAPIUrl = 'http://139.59.57.23:3000/user';
    final response = await http.get(usersListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => new User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _usersListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].userName, data[index].firstName, Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title??"Null",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle??"Null"),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}