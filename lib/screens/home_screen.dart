import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:test1/screens/cart_screen.dart';
import 'package:test1/models/provider_model.dart';
import 'package:test1/widgets/drawer_widget.dart';
import 'package:test1/services/fetch_products_service.dart';
import 'package:test1/screens/single_products_screens.dart';
import 'package:provider/provider.dart';

import '../models/login_provider_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => context.read<ProviderModel>().changeState(),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: sw * 0.02),
              child: TextButton.icon(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(sw*0.3,sh*0.03)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                  elevation: MaterialStateProperty.all(1),
                  shadowColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartScreen()
                      ));
                },
                label: Text(
                  'My Cart',
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: sh * 0.04,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
          title: Text('Products by categories',style: TextStyle(fontSize: sw*0.04),),
          elevation: 24,
          backgroundColor: Colors.deepOrangeAccent,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('Electronic',style: TextStyle(fontSize: sw*0.035),),
              ),
              Tab(
                child: Text('jewelery',style: TextStyle(fontSize: sw*0.035),),
              ),
              Tab(
                child: Text("men's clothing",style: TextStyle(fontSize: sw*0.035),),
              ),
              Tab(
                child: Text("women's clothing",style: TextStyle(fontSize: sw*0.035),),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleProductsScreen(
              url: 'https://fakestoreapi.com/products/category/electronics',
            ),
            SingleProductsScreen(
              url: 'https://fakestoreapi.com/products/category/jewelery',
            ),
            SingleProductsScreen(
              url: "https://fakestoreapi.com/products/category/men's clothing",
            ),
            SingleProductsScreen(
              url:
                  "https://fakestoreapi.com/products/category/women's clothing",
            ),
          ],
        ),
      ),
    );
  }
}
