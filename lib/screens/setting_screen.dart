import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:test1/screens/changePassword_screen.dart';
import 'package:test1/models/database_model.dart';

import 'package:provider/provider.dart';
import 'package:test1/screens/login_screen.dart';
import '../models/login_provider_model.dart';

class SettingScreen extends StatelessWidget {
  var db = DatabaseService() ;

  removeAcount(String uname,BuildContext context)async{

   await db.deleteUser(uname).whenComplete((){
      print('تم الحذف');
    }).catchError((erorr){
      print('erorr deleted');
    });
  }

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    var username =  context.watch<MLoginModel>().username ;

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Setting',
          style: TextStyle(letterSpacing: 2, color: Colors.grey[800]),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pop(context),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: sw * 0.03,
            right: sw*0.03,
            top: sh * 0.04,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: sh * 0.02),
                child: Text(
                  'GENERAL SETTINGS',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: sh * 0.03,
                      color: Colors.deepOrangeAccent,
                      letterSpacing: 2),
                ),
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sw * 0.02, vertical: sh * 0.02),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen(),
                              ));
                        },
                        child: ListTile(
                          title: Text(
                            'Change Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                                letterSpacing: 2),
                          ),
                          leading: Icon(
                            Icons.lock,
                            color: Colors.grey[800],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.deepOrangeAccent[400],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[800],
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                            'Change Language',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                                letterSpacing: 2),
                          ),
                          leading: Icon(
                            Icons.language,
                            color: Colors.grey[800],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.deepOrangeAccent[400],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[800],
                      ),
                      InkWell(
                        onTap: () {
                          removeAcount(username,context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                              ));
                        },
                        child: ListTile(
                          title: Text(
                            'Remove Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[800],
                                letterSpacing: 2),
                          ),
                          leading: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          trailing: Icon(
                            Icons.person_remove_alt_1_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
