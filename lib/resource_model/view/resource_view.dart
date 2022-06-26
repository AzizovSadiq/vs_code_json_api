import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api_learn/resource_model/service/resource_service.dart';
import 'package:json_api_learn/resource_model/view_model/resource_view_model.dart';
import 'package:json_api_learn/resource_model/view_model/resource_view_provider_model.dart';
import 'package:provider/provider.dart';
class ResourceView extends StatefulWidget {
  ResourceView({Key? key}) : super(key: key);

  @override
  State<ResourceView> createState() => _ResourceViewState();
}

// class _ResourceViewState extends ResourceViewModel {
class _ResourceViewState extends State<ResourceView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: ((context) => ResourceViewProviderModel(
      ResourceService(Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'))))),
      builder: (context,child){
        return  Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar:AppBar(
        centerTitle: true,
        title:context.watch<ResourceViewProviderModel>().isLoading ? const CircularProgressIndicator(color: Colors.amber): null,
      ),
      body:ListView.builder(
        itemCount:context.watch<ResourceViewProviderModel>().resource?.length ?? 0,
        itemBuilder: (context,index){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(context.watch<ResourceViewProviderModel>().resource?[index].title ?? ''),
            subtitle:Text(context.watch<ResourceViewProviderModel>().resource?[index].body ?? ''),
            leading: Text((context.watch<ResourceViewProviderModel>().resource?[index].id ?? '').toString()),
          ),
        );
      })
    );
      },
      );
   
  }

  
}