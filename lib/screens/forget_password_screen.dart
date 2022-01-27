import 'dart:math';


import 'package:flutter/material.dart';
import 'package:code_input/code_input.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:test1/models/database_model.dart';
import 'package:test1/models/login_provider_model.dart';
import 'package:test1/models/user_model.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';
class ForgetPasswordScreen extends StatelessWidget {
var db = DatabaseService();

  changePass({required String username,required String password,required BuildContext context}) async{
    User user = User(username , password);
    await db.updateUsse(user).whenComplete(() {
      print('dooooon Update Paaaassssword');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  TextEditingController passwordControler = TextEditingController() ;
String txtNum = getRNumber();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    bool  val = context.watch<MLoginModel>().isVisible ;
    Object? s = ModalRoute.of(context)!.settings.arguments ;
    String username = s.toString() ;

    return SafeArea(
      top: true,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('New PassWord'),
          leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: (){context.read<MLoginModel>().toFalse();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));

          },),
        ),
        backgroundColor: Colors.deepOrange.withRed(150),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: sw*0.2,vertical: sh*0.1),
                  child: Text(txtNum,style: TextStyle(fontSize: 60),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: sw*0.1,vertical: sh*0.01),
                  child: Container(
                    child: CodeInput(
                        length:4,
                        builder: CodeInputBuilders.circle(
                            border: Border.all(color: Colors.amberAccent),
                            color: Colors.black,
                            textStyle: TextStyle(color: Colors.green)),
                        onChanged:  (value) {
                          context.read<MLoginModel>().isLike(value, txtNum);
                        }
                    ),
                  ),
                ),
                Visibility(
                    visible: val,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passwordControler,
                              decoration: InputDecoration(
                                labelText: 'Inter New PassWord',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if(value.toString().isNotEmpty){
                                  return null ;
                                }else return 'inter password' ;
                              },
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Inter the PassWord Agin',
                                  prefixIcon: Icon(Icons.security)),
                              validator: (value) {
                                if(passwordControler.text.toString() == value.toString() ){
                                  return null ;
                                }else return 'inter password' ;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                 changePass(username: username, password: passwordControler.text.toString(), context: context);
                                } return null ;
                              },
                              child: Text(
                                'Change',
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.black54)),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getRNumber() {
  String txtNum = '';
  for (var i = 0; i < 4; i++) {
    txtNum = txtNum + Random().nextInt(9).toString();
  }
  return txtNum ;
}
