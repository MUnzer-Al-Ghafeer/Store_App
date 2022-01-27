import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:test1/models/products_model.dart';

import 'myCart_model.dart';

class ProviderModel with ChangeNotifier {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  bool isOpen = false;

  List<Product> cartList = [];

  int itemCount = 1;



  addToCart(Product product) {
    cartList.add(product);

    notifyListeners();
  }

  addItemCount() {
    itemCount++;
    notifyListeners();
  }

  subItemCount() {
    if (itemCount > 1)
      itemCount--;
    else
      itemCount = 1;
    notifyListeners();
  }

  void changeState() {
    if (isOpen == false) {
      zoomDrawerController.open?.call();
    } else
      zoomDrawerController.close?.call();
    isOpen = !isOpen;
    notifyListeners();
  }

  changeCheck(List<Product> list, int index) {
    CartModel().changeValue(list, index);
    notifyListeners();
  }

  removeItem(){
      cartList.removeWhere((element) => element.check==true);
      print(cartList.length);
      notifyListeners();
  }

  List<Map> buyList = [] ;
  addToPurchases (){
    double total = 0.0 ;
    for(var i in cartList){
      if(i.check==true){
        total = total + i.price * i.item ;
      }
    }
    var date = DateTime.now();
    DateFormat newTime = DateFormat.yMd().add_jm();
    String realDate =  newTime.format(date);
    buyList.addAll([{'total': total ,'date':realDate}]);
    removeItem();
    notifyListeners();
  }

  deleteAllItems(){
    buyList.clear();
    notifyListeners();
  }

   int counts =0   ;
  getCountItems(List<Product> list){
    counts = 0 ;
    for(var i in list){
      if(i.check==true){
        counts = counts + i.item ;
        notifyListeners();
      }
    }print(" c $counts");
  }

  List<Map> activitiesList = [];
  addToActivities ({required Icon icon,required String title,}){
    var date = DateTime.now();
    DateFormat newTime = DateFormat.yMd().add_jm();
    String realDate =  newTime.format(date);
    activitiesList.addAll([
      {'icon': icon,'date':realDate ,'title': title,}
    ]);
    notifyListeners();
  }

}
