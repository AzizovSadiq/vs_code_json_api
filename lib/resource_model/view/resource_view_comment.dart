import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/resource_view_comment_model.dart';

class ResourceViewCommet extends StatefulWidget {
  ResourceViewCommet({Key? key,this.id}) : super(key: key);
  final int? id; 
  @override
  State<ResourceViewCommet> createState() => _ResourceViewCommetState();
}

class _ResourceViewCommetState extends State<ResourceViewCommet> {
  @override
  Widget build(BuildContext context) {
    final index = widget.id ?? 0;

    return Consumer<ResourceViewCommentModel>(builder: ((context, value, child) {
      
      return Scaffold(
        appBar: AppBar(),
        body:ListTile(
          title: Text((value.comment?[index].name ?? '')),
          subtitle: Text((value.comment?[index].email ?? '')),
        ),
      );
    }));
  }
}