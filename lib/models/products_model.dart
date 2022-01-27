import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  late int id;
  late String title;
  late double price;
  late String category;
  late String description;
  late String image;
  late int item ;
  late bool check ;

  Product({
     this.id=0,
     this.title='',
     this.price=0,
     this.category='',
     this.description='',
     this.image='',
    this.item=1,
    this.check = false ,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "price": this.price,
      "category": this.category,
      "description": this.description,
      "image": this.image,
      "item": this.item,
      "check": this.check,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      category: json["category"],
      description: json["description"],
      image: json["image"],
    );
  }
}

class Products {
   List<dynamic> productsList;

  Products({required this.productsList});

  factory Products.fromJson(Map<String, dynamic> jsonData) {
    return Products(productsList: jsonData['productsList'],
    );
  }

  Map<String, dynamic> toJson(Products modelData) {
    return {
      "productsList": modelData.productsList,
    };
  }
}
