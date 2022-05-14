
import 'package:employee_directory/core/models/employee.dart';
import 'package:employee_directory/core/viewmodel/homeViewModel.dart';
import 'package:employee_directory/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EmployeeAdapter.dart';

class EmployeeSearch extends SearchDelegate{
  EmployeeSearch():super(
      textInputAction:TextInputAction.none,
      searchFieldLabel: 'Search...'
  );
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        builder: (context,snapshot){
          return Text(query);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return Container(
      color: Colors.grey[200],
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<Employee>>(
          future: provider.searchEmployee(query),
          builder: (context,snapshot){
            if(query==""){
              return Container();
            }
            return ListView.builder(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                return
                  EmployeeAdapter(snapshot.data![index]);
              },
            );

          }),
    );
  }

}