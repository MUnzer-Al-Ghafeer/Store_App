import 'package:test1/models/products_model.dart';
class CartModel  {

  List<Product> cartList = [];

  changeValue (List<Product> list,int index){
    list[index].check = !list[index].check ;
  }

}