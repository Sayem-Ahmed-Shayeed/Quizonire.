import 'package:flutter/material.dart';
import 'package:quizonire_app/appbar.dart';
import 'package:quizonire_app/colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar, //(this is in appbar.dart file check this out)
        backgroundColor: deepBlue,
        body: const Text("Hi"),
      ),
    ),
  );
}
