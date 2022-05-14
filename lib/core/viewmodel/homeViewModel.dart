import 'package:employee_directory/core/ApiResponse.dart';
import 'package:employee_directory/core/DBProvider.dart';
import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/services/apiServices.dart';
import 'package:employee_directory/views/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  List<Employee>? employeeList;
  bool isLoading = true;

  Future<void> getAllEmployees() async {
    DBProvider dbProvider = DBProvider.getInstance();
    employeeList = await dbProvider.getAllEmployees();
    isLoading = false;
    notifyListeners();
  }

  Future<List<Employee>> searchEmployee(String query) async {
    return employeeList!
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.email.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
