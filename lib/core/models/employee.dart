// To parse this JSON data, do
//
//     final employee = employeeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Employee employeeFromMap(String str) => Employee.fromMap(json.decode(str));

String employeeToMap(Employee data) => json.encode(data.toMap());

class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  String profileImage;
  Address? address;
  String phone;
  String website;
  Company? company;

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    profileImage: json["profile_image"]??"",
    address: json["address"]!=null? Address.fromMap(json["address"]):null,
    phone: json["phone"]??"",
    website: json["website"]??"",
    company:json["company"]!=null? Company.fromMap(json["company"]):null,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "profile_image": profileImage,
    //"address": address.toMap(),
    "phone": phone,
    "website": website,
    //"company": company.toMap(),
  };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo? geo;
  int? empId;

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: json["geo"]!=null?Geo.fromMap(json["geo"]):null,
  );

  Map<String, dynamic> toMap() => {
    "street": street,
    "suite": suite,
    "city": city,
    "empId": empId,
    "zipcode": zipcode,
    // "geo": geo.toMap(),
  };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toMap() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;
  int? empId;

  factory Company.fromMap(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "empId": empId,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
