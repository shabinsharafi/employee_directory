import 'dart:io';

import 'package:employee_directory/core/models/employee.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider.getInstance();

  DBProvider.getInstance();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();

    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'employee_directory.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      Batch batch = db.batch();

      batch.execute('CREATE TABLE Employee('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'username TEXT,'
          'email TEXT,'
          'profile_image TEXT,'
          'phone TEXT,'
          'website TEXT'
          ')');

      batch.execute('CREATE TABLE Address('
          'id INTEGER PRIMARY KEY,'
          'empId INTEGER,'
          'street TEXT,'
          'suite TEXT,'
          'city TEXT,'
          'zipcode TEXT,'
          "FOREIGN KEY (empId) REFERENCES Employee (id) ON DELETE NO ACTION ON UPDATE NO ACTION"
          ')');

      batch.execute('CREATE TABLE Company('
          'id INTEGER PRIMARY KEY,'
          'empId INTEGER,'
          'name TEXT,'
          'catchPhrase TEXT,'
          'bs TEXT,'
          "FOREIGN KEY (empId) REFERENCES Employee (id) ON DELETE NO ACTION ON UPDATE NO ACTION"
          ')');

      await batch.commit();
    });
  }

  addEmployee(Employee newEmployee) async {
    final db = await database;
    final res = await db.insert('Employee', newEmployee.toMap());
    return res;
  }

  addAddress(Address address) async {
    final db = await database;
    final res = await db.insert('Address', address.toMap());
    return res;
  }

  addCompany(Company company) async {
    final db = await database;
    final res = await db.insert('Company', company.toMap());
    return res;
  }

  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Employee');

    return res;
  }

  Future<List<Employee>> getAllEmployees() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM EMPLOYEE");
    List<Employee> list = [];
    if(res.isNotEmpty) {
      for (var map in res) {
        Employee employee = Employee.fromMap(map);
        employee.address = await getAddress(employee.id);
        employee.company = await getCompany(employee.id);
        list.add(employee);
      }
    }
    return list;
  }

  Future<Address?> getAddress(id) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Address where empId=?",[id]);
    Address? list = res.isNotEmpty
        ? res.map((c) =>Address.fromMap(c)).toList().first
        : null;
    return list;
  }
  Future<Company?> getCompany(id) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Company where empId=?",[id]);
    Company? list = res.isNotEmpty
        ? res.map((c) =>Company.fromMap(c)).toList().first
        : null;
    return list;
  }
}
