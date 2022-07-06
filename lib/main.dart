import 'package:flutter/material.dart';
import 'package:widget_tutorial/home.dart';
import 'package:widget_tutorial/success.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home':(context)=>Home(),
      '/success':(context)=>SuccessScreen()
    },
  ));
}

