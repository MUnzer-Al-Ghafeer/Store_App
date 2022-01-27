import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:test1/services/fetch_products_service.dart';
import 'package:test1/models/provider_model.dart';
import 'categories_screen.dart';
import '../models/products_model.dart';
import 'package:provider/provider.dart';

class SingleProductsScreen extends StatelessWidget {
  String url;

  SingleProductsScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    Future<List<Product>> fechdata = ProductApi().fetchData(url);
    return Center(
      child: FutureBuilder<List<Product>>(
          future: fechdata,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();
            else {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: sh * 0.01, horizontal: sw * 0.01),
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: sw * 0.01,
                      mainAxisSpacing: sh * 0.01,
                    ),
                    itemBuilder: (context, index) {
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoriesScreen(),
                                      settings: RouteSettings(
                                          arguments: snapshot.data![index])));
                            },
                            child: Card(
                              elevation: 24,
                              shadowColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.network(
                                      snapshot.data![index].image,
                                      height: constraints.maxHeight * 0.65,
                                      width: constraints.maxWidth,
                                    ),
                                    Text(
                                      snapshot.data![index].title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: constraints.maxHeight * 0.07,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          snapshot.data![index].price
                                                  .toString() +
                                              r' $',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  constraints.maxHeight * 0.07),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<ProviderModel>()
                                                .addToCart(
                                                    snapshot.data![index]);
                                          },
                                          child: Text(
                                            'Buy',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else
                return Text("There is no data",style: TextStyle(color: Colors.grey),);
            }
          }),
    );
  }
}

