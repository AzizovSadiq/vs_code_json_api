import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api_learn/home.dart';
import 'package:json_api_learn/main.dart';
import 'package:json_api_learn/resource_model/service/resource_service.dart';
import 'package:json_api_learn/resource_model/view/resource_view.dart';
import 'package:json_api_learn/resource_model/view_model/resource_view_comment_model.dart';
import 'package:json_api_learn/resource_model/view_model/resource_view_provider_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
  
       MultiProvider(
        providers: [
         ChangeNotifierProvider(create: (context)=> ResourceViewProviderModel(
          ResourceService(Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'))))),
         //ikinci provider-da var onu burada nece qeyd edim
        ],
         child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  ResourceView(),
             ),
       );
   
  }
}


