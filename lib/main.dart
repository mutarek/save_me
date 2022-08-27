import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me/layouts/myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}
