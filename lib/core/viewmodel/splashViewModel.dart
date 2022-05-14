import 'package:employee_directory/core/ApiResponse.dart';
import 'package:employee_directory/core/DBProvider.dart';
import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/services/apiServices.dart';
import 'package:employee_directory/views/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  late ApiResponse response;
  bool isLoading = true;

  Future<void> fetchDataFromServer(context) async {
    response = await ApiService().getEmployeeData();
    if (response.success) {
      await addToLocalDb();
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }

  Future<void> addToLocalDb() async {
    DBProvider dbProvider = DBProvider.getInstance();
    await dbProvider.deleteAllEmployees();
    for (var data in response.data) {
      Employee employee = Employee.fromMap(data);
      await dbProvider.addEmployee(employee);
      if (employee.address != null) {
        employee.address!.empId = employee.id;
        await dbProvider.addAddress(employee.address!);
      }
      if (employee.company != null) {
        employee.company!.empId = employee.id;
        await dbProvider.addCompany(employee.company!);
      }
    }
    return;
  }
}
