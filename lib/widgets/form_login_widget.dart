import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/database_model.dart';
import 'package:test1/screens/drawer_screen.dart';
import 'package:test1/screens/forget_password_screen.dart';
import 'package:test1/screens/home_screen.dart';
import 'package:test1/models/login_provider_model.dart';
import 'package:test1/models/user_model.dart';

import 'drawer_widget.dart';


 BuildForm(
    {
      required BuildContext context,
    required sh,
    required sw,
      required key ,
    required String titleScreen,
    required List lstData}) {
  var db = DatabaseService();
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextButton buildTextButton({
    required String title,
    required Function fun,
  }) =>
      TextButton(
          onPressed:()=> fun() ,
          child: Text(
            title!='Forget Password?'?
            context.watch<MLoginModel>().titleTextButton:'Forget Password?',
            style: TextStyle(color: Colors.orange),
          ));
  return
FutureBuilder(
  future: db.getAllUser(),
  builder: (context, snapshot) {
    var data =  snapshot.data! as List<User>;
     return Form(
        key: key,
        child:
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: sh * 0.22,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.23),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: txtUser,
                      style: TextStyle(color: Colors.white70),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        hoverColor: Colors.white54,
                        labelText: 'Inter UserName',
                        labelStyle: TextStyle(
                          fontSize: sh * 0.02,
                          color: Colors.amber,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.yellow[900],
                          size: sh * 0.03,
                        ),
                      ),
                      validator: (value) {

                        for(var i=0 ; i<data.length ; i++){
                          if (data[i].username != value.toString() ) {
                            return 'no this acount';
                          }
                          return null;
                        }
                    },
                    )),
                SizedBox(height: sh * 0.02,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.23),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: txtEmail,
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        labelText: 'Inter E_mail',
                        labelStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: sh * 0.02,
                        ),
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: Colors.yellow[900],
                          size: sh * 0.03,
                        ),
                      ),
                      validator: (value) {
                        if (!value.toString().isEmail()) {
                          return 'Incorrect formula';
                        }
                        return null;
                      },
                    )),
                SizedBox(height: sh * 0.02,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.23),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: txtPass,
                      style: TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                          labelText: 'Inter PassWord',
                          labelStyle: TextStyle(
                            color: Colors.amber,
                            fontSize: sh * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.security,
                            color: Colors.yellow[900],
                            size: sh * 0.03,
                          )),
                      validator: (value) {
                        if (!value.toString().isPasswordEasy()) {
                          return 'Incorrect formula';
                        }
                        return null;
                      },
                    )),
                SizedBox(height: sh * 0.02,),
                Visibility(
                    visible: context.watch<MLoginModel>().visiblePass,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: sw * 0.23),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.white70),
                          decoration: InputDecoration(
                              labelText: 'Confirm PassWord',
                              labelStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: sh * 0.02,
                              ),
                              prefixIcon: Icon(
                                Icons.security,
                                color: Colors.yellow[900],
                                size: sh * 0.03,
                              )),
                          validator: (value) {
                            if (value.toString() != txtPass.text) {
                              return 'Incorrect formula';
                            }
                            return null;
                          },
                        ))),
                SizedBox(height: sh * 0.015,),
              ],
            ),
            Visibility(
              visible: context.watch<MLoginModel>().visibletext,
              child: Positioned(
                  bottom: sh * 0.33,
                  child: buildTextButton(title: 'Forget Password?',
                      fun: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen(),
                                settings: RouteSettings(
                                  arguments: getNumber(),
                                )
                            ));
                      })),
            ),
            SizedBox(height: sh * 0.01,),
            Positioned(
                bottom: sh * 0.27,
                child: Row(
                  children: [
                    Text(
                      context.watch<MLoginModel>().titleText,
                      style: TextStyle(color: Colors.amber[200]),
                    ),
                    buildTextButton(title: 'Sign up',fun: ()=> context.read<MLoginModel>().ChangTitle()),
                  ],
                )),
            Positioned(
                bottom: sh * 0.185,
                child: ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      lstData.addAll([
                        txtUser.text,
                        txtEmail.text,
                        txtPass.text,
                      ]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrawerAndHome(),
                          ));
                    }
                  },
                  child: Text(
                    titleScreen,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: sh * 0.02,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(sw * 0.4, sh * 0.05)),
                    // padding: MaterialStateProperty.all(
                    //     EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.amber[800],
                    ),
                    shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(11),
                          top: Radius.circular(11),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      );
  }
);

}
getNumber() {
  String txtNum = '';
  for (var i = 0; i < 4; i++) {
    txtNum = txtNum + Random().nextInt(9).toString();
  }
  return txtNum;
}