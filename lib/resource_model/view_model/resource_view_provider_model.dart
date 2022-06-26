
import 'package:flutter/cupertino.dart';
import 'package:json_api_learn/resource_model/model/resource_model.dart';
import 'package:json_api_learn/resource_model/service/resource_service.dart';

class ResourceViewProviderModel extends ChangeNotifier{
  final IResourceService resourceService;
  List<ResourceModel>? resource;
  bool isLoading = false;
  ResourceViewProviderModel(this.resourceService){
  _fetch();
  }
  void changeLoading(){
  isLoading = !isLoading;
  notifyListeners();
  }
  void _fetch()async{
    changeLoading();
    resource = await resourceService.fetchResourcePost();
    changeLoading();
  }
}