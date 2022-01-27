import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test1/models/provider_model.dart';
class PurchasesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    List<Map> buyList = context.watch<ProviderModel>().buyList;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('My Purchases'),
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pop(context),),
        backgroundColor: Colors.deepOrange,
      ),
      body: buyList.isEmpty?Center(child: Text('no any Purchases'),):
      Stack(
        children: [
          ListView.builder(
            itemCount: buyList.length,
            itemBuilder: (context, index) =>
            Card(
              margin: EdgeInsets.symmetric(horizontal: sw*0.02,vertical: sh*0.02),
              color: Colors.grey[700],
              elevation: 12,
              shadowColor: Colors.grey,
              child: ListTile(
                title: Text("Total:   ${buyList[index]['total']}"+r' $'),
                subtitle: Text("${buyList[index]['date']}"),
                leading: CircleAvatar(child: Icon(Icons.shopping_cart_rounded,color: Colors.deepOrange,),backgroundColor: Colors.grey[800],),
              ),
            ),),
          Align(
            alignment: Alignment.bottomRight,
            child:      Padding(
              padding:  EdgeInsets.symmetric(horizontal: sw*0.015,vertical: sh*0.015),
              child: FloatingActionButton(
                tooltip: 'delete All',
                splashColor: Colors.deepOrange,
                heroTag: 'deleteAll',
                backgroundColor: Colors.white70,
                child: Icon(
                  Icons.delete,
                  color: Colors.deepOrange[900],
                ),
                onPressed: () {
                  context.read<ProviderModel>().deleteAllItems();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
