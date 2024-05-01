import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart 'as http;
import '../Model/employeemodel.dart';


class LessonApiService {
/*static Future<List<Employeee>>fetchlessons()async {
  final responce = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (responce.statusCode == 200) {
  List<dynamic>jsonResponce = jsonDecode(responce.body);
  print('${responce}');
  List<Employeee> lesson = jsonResponce.map<Employeee>((data)=>Employeee.fromJson(data)).toList();
   return lesson;
   } else {
   throw Exception('Failed to load lesson');
   }
}*/
  static Future <List<EmployeeModel>> fetchlessons() async {
    print('Reading from assets');
    final String response = await rootBundle.loadString('assets/sample.json');

    if (response != null) {
      List<dynamic> jsonResponse = jsonDecode(response);
      List<EmployeeModel>lesson = jsonResponse.map((data) => EmployeeModel.fromJson(data as Map<String,dynamic>)).toList();
      print('$lesson}');
      return lesson;
    } else {
      throw Exception('Failed to load Employee');
    }
  }
}
