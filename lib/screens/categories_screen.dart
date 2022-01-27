
import 'package:flutter/material.dart';
import 'package:test1/models/myCart_model.dart';
import 'package:test1/models/products_model.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer_widget.dart';
import '../models/provider_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    var index = ModalRoute.of(context)!.settings.arguments;
    index as Product;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pop(context),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sh * 0.5,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Image.network(
                  '${index.image}'
                ),
              ),
            ),
            buildPadding(sw: sw, sh: sh, index: index.title, txt: 'Title'),
            buildPadding(
                sw: sw, sh: sh, index: index.description, txt: 'Description'),
            buildPadding(
                sw: sw, sh: sh, index: index.category, txt: 'Category'),
            buildPadding(
                sw: sw, sh: sh, index: "${index.price}" r' $', txt: 'Price'),
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton(heroTag: 'a1',
        backgroundColor: Colors.deepOrange,
        hoverColor: Colors.deepOrangeAccent[400],
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<ProviderModel>().itemCount = 1 ;
          showDialog(context: context,
             barrierDismissible: false,
             builder: (BuildContext ctx) =>
              buildAlertDialog(sh: sh,ctx:  ctx,context:  context,index:  index) ,
          );
        },
      ),
    );
  }

   buildAlertDialog(
      {required double sh,required BuildContext ctx,required BuildContext context,required Product index}) {
    return
      AlertDialog(
              backgroundColor: Colors.grey,
              title: Text(
                'How many do you want',
                style: TextStyle(
                  fontSize: sh * 0.04,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          ctx.read<ProviderModel>().addItemCount();
                        },
                        icon: Icon(Icons.keyboard_arrow_up_outlined,),
                        iconSize: sh * 0.05,
                        color: Colors.deepOrange),
                    Text('${ctx.watch<ProviderModel>().itemCount}',
                        style: TextStyle(fontSize: sh * 0.04, color: Colors.black)),
                    IconButton(
                        onPressed: () {
                          context.read<ProviderModel>().subItemCount();
                        },
                        icon: Icon(Icons.keyboard_arrow_down_outlined,),
                        iconSize: sh * 0.05,
                        color: Colors.deepOrange),
                  ],
                ),
              ),
              actions:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                    ),
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(ctx);
                      // ctx.read<ProviderModel>().itemCount = 1 ;
                    },
                  ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                      ),
                      child: Text('Buy'),
                      onPressed: () {
                        index.item = ctx.read<ProviderModel>().itemCount;
                        ctx.read<ProviderModel>().addToCart(index);
                        Navigator.pop(context);
                        // ctx.read<ProviderModel>().itemCount = 1 ;
                      },
                    ),
                  ],)
              ],
            );
  }

  Padding buildPadding({required double sw, required double sh, required String index, required String txt}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.01, vertical: sh * 0.02),
      child: Card(
        color: Colors.grey[700],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: sw * 0.02, top: sh * 0.01),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  txt,
                  style: TextStyle(
                      color: Colors.deepOrange[100], fontSize: sh * 0.025),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: sw * 0.15, bottom: sh * 0.015, right: sw * 0.02),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    fontSize: sh * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
