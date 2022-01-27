import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test1/screens/categories_screen.dart';

import 'package:test1/services/fetch_products_service.dart';
import 'package:test1/models/myCart_model.dart';
import 'package:test1/models/products_model.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/user_model.dart';
import '../models/database_model.dart';
import '../models/provider_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Set<Product> lstToSet = context.watch<ProviderModel>().cartList.toSet();
    List<Product> data = lstToSet.toList();
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    var count = context.watch<ProviderModel>();
    var db = DatabaseService();
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:
        Text('My Cart'),
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pop(context),),
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sh * 0.02),
          child: data.isEmpty
              ? Center(
                  child:  Text('No Any Product'),
                )
              : Stack(
                  children: [
                    ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.grey[700],
                        elevation: 12,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.02, vertical: sh * 0.02),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total: ${(data[index].item) * data[index].price}"
                                  r'$',
                                  style: TextStyle(
                                    fontSize: sh * 0.03,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 4,
                                ),
                                Text(
                                  "count ${data[index].item}" +
                                      ' x ' +
                                      data[index].price.toString() +
                                      r'$',
                                  style: TextStyle(
                                      fontSize: sh * 0.02,
                                      color: Colors.white30),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                            subtitle: Text(data[index].title),
                            leading: CircleAvatar(
                                backgroundColor: Colors.grey[700],
                                child: Image.network(
                                  data[index].image.toString(),
                                  fit: BoxFit.fill,
                                ),
                                minRadius: 30,
                                maxRadius: 30),
                            trailing: Checkbox(
                                checkColor: Colors.black,
                                fillColor: MaterialStateProperty.all(
                                    Colors.deepOrange[400]),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.black45),
                                value: data[index].check,
                                onChanged: (value) {
                                  context.read<ProviderModel>().changeCheck(data, index);
                                }),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        splashColor: Colors.deepOrange,
                        heroTag: 'a2',
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.delete,
                          color: Colors.deepOrange[900],
                        ),
                        onPressed: () {
                          context.read<ProviderModel>().removeItem();
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        heroTag: 'a3',
                        backgroundColor: Colors.deepOrange[900],
                        child: Icon(
                          Icons.shop,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          context.read<ProviderModel>().addToPurchases();
                          context.read<ProviderModel>().getCountItems(data);
                          context.read<ProviderModel>().addToActivities(
                                icon: Icon(Icons.add_to_photos),
                                title: 'buy ' + '${count.counts}' + '${count.counts > 1 ? ' Products' : ' Product'}',
                              );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
