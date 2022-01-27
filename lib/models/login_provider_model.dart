
import 'package:flutter/material.dart';

class MLoginModel with ChangeNotifier {
  String titleScreen ;
  String titleTextButton ;
  String titleText ;
  bool visiblePass ;
  bool visibletext ;
  String username='' ;
  String password='' ;
  String txt1 = 'false' ;

  MLoginModel({this.titleScreen='Login',this.titleTextButton='Sign up',this.visiblePass=false,this.visibletext=true,this.titleText="Don't have acount?"}) ;

  void ChangTitle (){
    titleTextButton=='Sign up'?titleTextButton='Login':titleTextButton='Sign up';
    titleText=="Don't have acount?"?titleText="have you acount?":titleText="Don't have acount?";
    titleScreen=='Login'?titleScreen='Sign up':titleScreen='Login';
    visiblePass==false?visiblePass=true:visiblePass=false;
    visibletext==true?visibletext=false:visibletext=true;
    notifyListeners();
  }

  bool isVisible= false;
  void toFalse(){
    isVisible = false ;
    notifyListeners();
  }
  void isLike(String value,String txtNum){
    if(value==txtNum){
            isVisible = true ;
          }else isVisible = false ;
    notifyListeners();
  }

  saveUserLogin(String user,String pas){
    username = user;
    password = pas;
    notifyListeners();
  }

  changetxt(String  newtxt){
    txt1 = newtxt ;
    notifyListeners();
  }

}