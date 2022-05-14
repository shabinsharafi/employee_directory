import 'package:employee_directory/core/viewmodel/homeViewModel.dart';
import 'package:employee_directory/views/EmployeeAdapter.dart';
import 'package:employee_directory/views/EmployeeSearch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration.zero,
        () => Provider.of<HomeViewModel>(context, listen: false)
            .getAllEmployees());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Employee List"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                showSearch(context: context, delegate: EmployeeSearch());
              },
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Consumer<HomeViewModel>(builder: (context, provider, child) {
        if (provider.isLoading) return CircularProgressIndicator();
        return ListView.builder(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
          itemCount: provider.employeeList?.length,
          itemBuilder: (context, index) =>
              EmployeeAdapter(provider.employeeList![index]),
        );
      }),
    );
  }
}
