import 'package:flutter/cupertino.dart';
import 'package:json_api_learn/resource_model/service/resource_service.dart';

import '../model/resource_comment_model.dart';

class ResourceViewCommentModel extends ChangeNotifier{
  final IResourceService resourceService;
  List<ResourceCommentModel>? comment;
  bool isLoading = false;
  final int? id;

  ResourceViewCommentModel(this.resourceService,this.id){
   _fetchCommentPost(id ?? 0);
  }
  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  void _fetchCommentPost(int id)async{
    changeLoading();
    comment =await resourceService.fetchCommentPost(id);
    changeLoading();
  }
}