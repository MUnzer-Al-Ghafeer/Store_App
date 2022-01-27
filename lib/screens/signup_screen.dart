import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:test1/models/database_model.dart';
import 'package:test1/screens/confirmation_screen.dart';

import 'package:test1/widgets/textformfield_widget.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:test1/models/user_model.dart';

import '../widgets/drawer_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool eyes1 = true ;
  bool eyes2 = true ;
  TextEditingController emailControler = TextEditingController();

  TextEditingController passwordControler = TextEditingController();
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTow = FocusNode();
  FocusNode nodeThree = FocusNode();
  FocusNode nodeFour = FocusNode();

  var _formKey = GlobalKey<FormState>();

  DatabaseService db = DatabaseService();

  Future<bool> getEmail() async {
    bool tOrf = false ;
    var us = emailControler.text;
    await db.getUser(us).then((userData) {
      if(userData == null){
        print('$userDataالمستخدم صالح ');
         tOrf = true ;
      }else tOrf = false ;
    });
    return tOrf ;
  }


  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return SafeArea(
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
            backgroundColor: Colors.transparent,

            title: Text('SignUp',style: TextStyle(color: Colors.grey[700]),),
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
                        child: Image.asset(
                          "images/login_images/login7.jpg",
                          height: sh * 0.35,
                          fit: BoxFit.fill,
                        )),
                    buildTextFormFieldWidget(
                      controler: null,
                      ifvalidate: (value) {
                        if (!value.toString().isUsername()) {
                          return 'userName is not true';
                        }
                        return null;
                      },
                      onsave: (value) {},
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: nodeOne,
                      focusName: nodeTow,
                      isPass: false,
                      sh: sh,
                      sw: sw,
                      icon: Icons.person,
                      lablel_text: 'Inter User Name',
                      endIcon: null,
                      funIcon: null,
                    ),
                    buildTextFormFieldWidget(
                        controler: emailControler,
                        ifvalidate: (value) {
                          if (!value.toString().isEmail()) {
                            return 'email is not true';
                          }else if(getEmail()==false){
                            return 'email is invalid' ;
                          }
                          return null;
                        },
                        onsave: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: nodeTow,
                      focusName: nodeThree,
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
                          if (!value.toString().isPasswordEasy()) {
                            return 'password is not true';
                          }
                          return null;
                        },
                        onsave: (value) {},
                        keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: nodeThree,
                      focusName: nodeFour,
                        isPass: eyes1,
                        sh: sh,
                        sw: sw,
                        icon: Icons.security,
                        lablel_text: 'Inter password',
                      endIcon:  eyes1?Icons.lock:Icons.lock_open,
                      funIcon: (){
                        setState(() {
                          eyes1 = !eyes1 ;
                        });
                      },
                    ),
                    buildTextFormFieldWidget(
                        controler: null,
                        ifvalidate: (value) {
                          if (passwordControler.text != value) {
                            return 'not like the password';
                          }
                          return null;
                        },
                        onsave: (value) {},
                        keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      focusNode: nodeFour,
                      focusName: null,
                        isPass: eyes2,
                        sh: sh,
                        sw: sw,
                        icon: Icons.security,
                        lablel_text: 'confirm password',
                      endIcon:  eyes2?Icons.lock:Icons.lock_open,
                      funIcon: (){
                        setState(() {
                          eyes2 = !eyes2 ;
                        });
                      },
                    ),
                    RaisedButton(
                        elevation: 12,
                        child: Text('SignUp'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var newUser =
                                User(emailControler.text, passwordControler.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmationScreen(),
                                    settings: RouteSettings(
                                      arguments: newUser,
                                    )
                                ));
                          } else
                            return print('erorr sign up');
                        }),
                    RaisedButton.icon(onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    }, label: Text('Sign in',style: TextStyle(color: Colors.blueGrey),),
                    icon: Icon(Icons.login,color: Colors.blueGrey[200],),
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
