import 'package:employee_directory/core/models/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatefulWidget {
  EmployeeDetailScreen(this.employee, {Key? key}) : super(key: key);
  Employee employee;

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Employee Details"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(
                        widget.employee.profileImage,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/dummy_user.jpg"),
                      )),
                  borderRadius: BorderRadius.circular(60),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.username,
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.email,
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.phone,
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Company Details",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.company?.name ?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.company?.catchPhrase ?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.company?.bs ?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Address Details",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.address?.suite?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.address?.street?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.address?.city?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.employee.address?.zipcode?? "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
