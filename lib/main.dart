import 'package:coviddata/datasource.dart';
import 'package:coviddata/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "Circular", primaryColor: primaryBlack),
    home: HomePage(),
  ));
}
