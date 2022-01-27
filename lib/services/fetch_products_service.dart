import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test1/models/products_model.dart';

class ProductApi {
  List<Product> prodList = [];
  Future<List<Product>> fetchData(String url) async {
   http.Response res =
        await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      // Products products = Products.fromJson(jsonData);
      // List<Product> prodList = products.productsList.map((e) => Product.fromJson(e)).toList() ;
      for(Map i in jsonData){
         prodList.add(Product.fromJson(i as Map<String,dynamic>));
      }
      return  prodList ;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
