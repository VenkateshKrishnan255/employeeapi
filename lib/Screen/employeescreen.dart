import 'package:flutter/material.dart';
import '../Model/employeemodel.dart';
import '../Server/apiserver.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<EmployeeModel> _lesson = [];

  Future<void> _loadlesson() async {
    try {
      List<EmployeeModel> response = await LessonApiService.fetchlessons();
      setState(() {

        _lesson = response;
        print('load lesson run');
      });

    } catch (e) {
      print('Error Loading lesson:$e');
    }
  }

  @override
  void initState() {
    _loadlesson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employeee'),
        ),
        body: _lesson == null || _lesson.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: _lesson.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text('id:${_lesson[index].id}'),
                      Text('name:${_lesson[index].name}'),
                      Text('username:${_lesson[index].username}'),
                      Text('email:${_lesson[index].email}'),
                      Text('address:${_lesson[index].address?.city}'),
                      Text('phone:${_lesson[index].phone}'),
                      Text('webside:${_lesson[index].website}'),
                      Text('company:${_lesson[index].company?.bs}'),
                    ],
                  ),
                );
              }),
        ));
  }
}
