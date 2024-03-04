import 'package:flutter/material.dart';
import 'package:medicinecasier/MedicineListPage.dart';
import 'package:medicinecasier/AddMedicinePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pharmacy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicineListPage(),
    );
  }
}
