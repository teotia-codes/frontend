import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/person.dart';
import 'package:http/http.dart'as http;
class Api {
  static const baseUrl = "http://172.20.10.2/api/";
  static addPerson(Map pdata)async {
    try{
      print(pdata);
      var url = Uri.parse("${baseUrl}add_person");
  final res = await http.post(url, body: pdata);
  if(res.statusCode == 200){
   var data = jsonDecode(res.body.toString());
   print(data);
  }else{
   print("Failed to upload Data");
  }
    } catch(e){
      debugPrint(e.toString());
    }
  
  }
static Future<List<Person>> getPersons() async {
  List<Person> persons = [];

  try {
    var url = Uri.parse("${baseUrl}get_person");
    final response = await http.get(url);

    print("Response body: ${response.body}"); // Add this line for debugging

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> personList = jsonResponse['person'];
      persons = personList.map((data) => Person.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  } catch (e) {
    throw Exception("Failed to load data: $e");
  }

  return persons;
}
}