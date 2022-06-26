
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api_learn/resource_model/model/resource_model.dart';
import 'package:json_api_learn/resource_model/service/resource_service.dart';
import 'package:json_api_learn/resource_model/view/resource_view.dart';

abstract class ResourceViewModel extends State<ResourceView>{
 late final IResourceService resourceService;
List<ResourceModel> ? resource;
bool isLoading = false;
@override
void initState() {
  super.initState();
  resourceService = ResourceService(Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')));
  fetch();
}
void changeLoading(){
 setState(() {
    isLoading = !isLoading;
 });
}
void fetch()async{
  changeLoading();
  resource = await resourceService.fetchResourcePost();
  changeLoading();
}
}