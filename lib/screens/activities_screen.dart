import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test1/models/provider_model.dart';

class ActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    List<Map> activitiesList = context.watch<ProviderModel>().activitiesList;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('My Activities'),
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pop(context),),
        backgroundColor: Colors.deepOrange,
      ),
      body: activitiesList.isEmpty
          ? Center(
              child: Text('no activities'),
            )
          : Stack(
              children: [
                ListView.builder(
                  itemCount: activitiesList.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: sw * 0.02, vertical: sh * 0.02),
                    color: Colors.grey[700],
                    elevation: 12,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      title: Text("${activitiesList[index]['title']}"),
                      subtitle: Text("${activitiesList[index]['date']}"),
                      leading: CircleAvatar(
                        child: activitiesList[index]['icon'],
                        backgroundColor: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
