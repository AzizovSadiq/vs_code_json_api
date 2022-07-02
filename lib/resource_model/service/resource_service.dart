
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_api_learn/resource_model/model/resource_comment_model.dart';
import 'package:json_api_learn/resource_model/model/resource_model.dart';

abstract class IResourceService{
  final Dio dio;

  IResourceService(this.dio);

  Future<List<ResourceModel>?> fetchResourcePost();
  Future<List<ResourceCommentModel>?> fetchCommentPost(int postId);
  
}

class ResourceService extends IResourceService{
  ResourceService(super.dio);

  @override
  Future<List<ResourceModel>?> fetchResourcePost()async {
   try {
     final responce = await dio.get('/posts');
   if(responce.statusCode == HttpStatus.ok){
    final result = responce.data;
    if(result is List){
      return result.map((e) => ResourceModel.fromJson(e)).toList();
    }
   }
   }on DioError catch (error) {
     print(error);
   }
   return null;
  }
  
  @override
  Future<List<ResourceCommentModel>?> fetchCommentPost(int postId) async{
    try {
      final responce =await dio.get('/comments',queryParameters: {'postId':postId});
    if(responce.statusCode == HttpStatus.ok){
      final result = responce.data;
      if(result is List){
        return result.map((e) => ResourceCommentModel.fromJson(e)).toList();
      }
    }
    } on DioError catch (error) {
      print(error);
    }
    return null;
  }
  
}