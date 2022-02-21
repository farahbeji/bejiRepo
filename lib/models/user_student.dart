import 'package:flutter/material.dart';


class Student {
  final int id;
  final String image;
  final Color color;
  final String name;
  final String email;
  final String password;
  final DateTime birthDate;
  final String spec_bac;
  final String major;
  final double SAT;
  final double TOAFL;
  final double BAC;

  Student({
    required this.id,
    required this.image,
    required this.color,
    required this.name,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.spec_bac,
    required this.major,
    required this.SAT,
    required this.TOAFL,
    required this.BAC,
  });
}

List<Student> students = [
  Student(
    id: 1,
    image: "assets/images/salut.png",
    color: Color(0xFF71b8ff),
    name: "beji farah",
    email: "farahbeji@gmail.com",
    password: "",
    birthDate: DateTime.now(),
    spec_bac: "sciences",
    major: "business computing",
    SAT:10.5,
    TOAFL: 10.5,
    BAC: 15
  ),

  Student(
    id: 1,
    image: "assets/images/salut.png",
    color: Color(0xFFff6374),
    name: "beji eya",
    email: "eyabeji@gmail.com",
    password: "",
    birthDate: DateTime.now(),
    spec_bac: "info",
    major: "business computing",
    SAT:10.5,
    TOAFL: 10.5,
    BAC: 15
  ),
 
];