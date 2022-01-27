import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:test1/widgets/form_login_widget.dart';
import 'package:test1/models/login_provider_model.dart';
import 'package:test1/screens/signup_screen.dart';
import 'package:test1/widgets/textformfield_widget.dart';
import 'package:test1/models/user_model.dart';
import 'package:provider/provider.dart';

import '../models/database_model.dart';
import '../widgets/drawer_widget.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txt1 = '';
  bool txtcolor = false ;
  bool eyes = true ;
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTow = FocusNode();

  List lstData = [];

  var _formKey = GlobalKey<FormState>();

  DatabaseService db = DatabaseService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = DatabaseService();
  }
  getEmail() async {
    var us = emailControler.text;
    await db.getUser(us).then((userData) {
      if(userData != null){
        setState(() {
          txt1 = 'Moving to change password ' ;
          txtcolor = true ;
        });
        print('$userData تم العثور على المستخدم ');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ForgetPasswordScreen(),
                settings: RouteSettings(
                  arguments: us,
                )
            ));
      }else {
        setState(() {
          txt1 = 'Erorr: wrong email';
          txtcolor = false ;
        });
      }
    }).catchError((erorr) {
      print(' خطا في البحث عن المستخدم   $erorr ');
      setState(() {
        txt1 = 'Erorr: wrong email';
        txtcolor = false ;
      });
    });
  }
  getLogin() async {
    var us = emailControler.text;
    var ps = passwordControler.text;
    await db.getUser(us).then((userData) {
      setState(() {
        txt1 = userData!.username.toString();
      });
      print('$userData تم العثور على المستخدم ');
      if(userData!.password.toString() == ps) {
        setState(() {
          txt1 = 'Signing in' ;
          txtcolor = true ;
        });
        context.read<MLoginModel>().saveUserLogin(us, ps);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DrawerAndHome(),
            ));
      }else {
        setState(() {
        txt1 = 'wrong password' ;
        txtcolor = false ;
      });}
    }).catchError((erorr) {
      print(' خطا في تسجيل الدخول  $erorr');
      setState(() {
        txt1 = 'Erorr: wrong email';
        txtcolor = false ;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    db.getAllUser();
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return
      SafeArea(
        top: true,
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                backgroundColor: Colors.black,
                resizeToAvoidBottomInset: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: Text(
                    'LogIn',
                    style: TextStyle(letterSpacing: 2,color: Colors.grey[700]),
                  ),
                  leading: Icon(Icons.login,color: Colors.grey[800],),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: sh * 0.35,
                              child:
                              Image.asset(
                                "images/login_images/login7.jpg",
                                height: sh * 0.35,
                                fit: BoxFit.fill,
                              )),
                          buildTextFormFieldWidget(
                              controler: emailControler,
                              ifvalidate: (value) {
                                if(value.toString().isEmail()){
                                  return null ;
                                }else return 'inter your email' ;
                              },
                              onsave: (value) {},
                              keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: nodeOne,
                            focusName: nodeTow,
                              isPass: false,
                              sh: sh,
                              sw: sw,
                              icon: Icons.alternate_email_sharp,
                              lablel_text: 'Inter email',
                              endIcon: null,
                            funIcon: null,
                          ),
                          buildTextFormFieldWidget(
                              controler: passwordControler,
                              ifvalidate: (value) {
                                if(value.toString().isPasswordEasy()){
                                  return null ;
                                }else return 'inter password' ;
                              },
                              onsave: (value) {},
                              keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            focusNode: nodeTow,
                            focusName: null,
                              isPass: eyes,
                              sh: sh,
                              sw: sw,
                              icon: Icons.security,
                              lablel_text: 'Inter password',
                            endIcon:  eyes?Icons.lock:Icons.lock_open,
                            funIcon: (){
                              setState(() {
                                eyes = !eyes ;
                              });
                            },
                          ),
                          RaisedButton(color: Colors.amber,
                              elevation: 12,
                              child: Text('LogIn'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  getLogin();
                                  print('don Log Innnnn');
                                } else
                                  setState(() {
                                    txt1 = '';
                                    print('erorr validat');
                                  });
                              }),
                          Text(
                            '$txt1',
                            style: TextStyle(color: txtcolor?Colors.green:Colors.red),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    getEmail();
                                  },
                                  child: Text(
                                    'Forget Password?   ',
                                    style: TextStyle(color: Colors.blueGrey),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have acount ?",style: TextStyle(color: Colors.orange),),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignUpScreen(),
                                            ));
                                      },
                                      child: Text(
                                        "SignUp",
                                        style: TextStyle(color: Colors.blueGrey),
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
      );
  }
}

