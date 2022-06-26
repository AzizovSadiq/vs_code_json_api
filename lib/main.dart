import 'package:flutter/material.dart';
import 'package:json_api_learn/home.dart';
import 'package:json_api_learn/main.dart';
import 'package:json_api_learn/resource_model/view/resource_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ResourceView(),
    );
  }
}


