import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/views/EmployeeDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeAdapter extends StatelessWidget {
  EmployeeAdapter(this.employee, {Key? key}) : super(key: key);
  Employee employee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmployeeDetailScreen(employee),
              ));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        employee.profileImage,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/dummy_user.jpg"),
                      )),
                  borderRadius: BorderRadius.circular(30),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        employee.name,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        employee.company?.name ?? "",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ])
              ],
            )),
      ),
    );
  }
}
