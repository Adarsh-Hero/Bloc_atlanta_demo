import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'address.dart';
import 'company.dart';

List<User> usersFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String usersToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String name;
  String userName;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(
      {this.address,
      this.company,
      this.email,
      this.userName,
      this.id,
      this.name,
      this.phone,
      this.website});

  factory User.fromJson(Map<String, dynamic> json, {isForDatabase = false}) =>
      User(
        id: json["id"] ?? 0,
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        userName: json['username'] ?? '',
        address: isForDatabase
            ? Address.fromMap(json['address']).toString()
            : Address.fromMap(json['address']),
        phone: json["phone"] ?? '',
        website: json["website"] ?? '',
        company: isForDatabase
            ? Company.fromJson(json['company']).toString()
            : Company.fromJson(json['company']),
      );

  Map<String, dynamic> toJson({isSavingData = false}) => {
        "email": email,
        "id": id,
        "name": name,
        "address": isSavingData ? address.toString() : address,
        "phone": phone,
        "website": website,
        "company": isSavingData ? company.toString() : company,
        "userName": userName,
      };

  static Future<User> insert(Database db, User data) async {
    await db.insert('users', data.toJson(isSavingData: true));
    return data;
  }

  static Future<List<Map<dynamic, dynamic>>> getItems(Database db,
      {String name, String id}) async {
    List<Map> maps =
        await db.query('users', where: "name LIKE ?", whereArgs: ['%$name%']);
    if (maps.isNotEmpty) {
      var users = <Map<dynamic, dynamic>>[];
      for (var i = 0; i < maps.length; i++) {
        users.add(maps[i]);
      }
      return users;
    }
    return [];
  }
}
