import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api_learn/resource_model/service/resource_service.dart';
import 'package:json_api_learn/resource_model/view/resource_view_comment.dart';
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
    return   Consumer<ResourceViewProviderModel>(builder: ((context, value, child) {
         return   Scaffold(
      backgroundColor: Colors.blueGrey[200],
      
      appBar:AppBar(
        centerTitle: true,
        title:value.isLoading ? const CircularProgressIndicator(color: Colors.amber): null,
      ),
      body:ListView.builder(
        itemCount:value.resource?.length ?? 0,
        itemBuilder: (context,index){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
              
              //sade variantda providersiz qururam ve isleyir amma providerla
             //her hansi bir carta tiklanan zaman error verir cunki provider qura bilmirem  
                 

            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return ResourceViewCommet(id: value.resource?[index].id,);
              }));
            },


            title: Text(value.resource?[index].title ?? ''),
            subtitle:Text(value.resource?[index].body ?? ''),
            leading: Text((value.resource?[index].id ?? '').toString()),
          ),
        );
      })
    );
      }),);
     
 
      }
      
   
  }

  
