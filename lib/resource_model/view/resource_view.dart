import 'package:flutter/material.dart';
import 'package:json_api_learn/resource_model/view_model/resource_view_model.dart';
class ResourceView extends StatefulWidget {
  ResourceView({Key? key}) : super(key: key);

  @override
  State<ResourceView> createState() => _ResourceViewState();
}

class _ResourceViewState extends ResourceViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar:AppBar(
        centerTitle: true,
        title: isLoading ? const CircularProgressIndicator(color: Colors.amber): null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _PostList(),
      )
    );
  }

  ListView _PostList() {
    return ListView.builder(
        itemCount: resource?.length ?? 0,
        itemBuilder: (context,index){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(resource?[index].title ?? ''),
            subtitle:Text(resource?[index].body ?? ''),
            leading: Text((resource?[index].id ?? '').toString()),
          ),
        );
      });
  }
}