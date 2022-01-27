import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/database_model.dart';
import 'package:test1/models/login_provider_model.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/screens/setting_screen.dart';
class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var _formKey = GlobalKey<FormState>();

  bool eyes1 = true ;
  bool eyes2 = true ;
  bool eyes3 = true ;

  TextEditingController oldPass = TextEditingController();

  TextEditingController newPass = TextEditingController();

  TextEditingController conPass = TextEditingController();

  var db = DatabaseService() ;

  chanhepassword(String us,BuildContext context) async {
    var ops = oldPass.text;
    var nps = newPass.text;
    await db.getUser(us).then((userData) {
      print('$userData تم العثور على المستخدم ');
      if(userData!.password.toString() == ops) {
        User user = User(us, nps) ;
        db.updateUsse(user);
        context.read<MLoginModel>().changetxt('done');
      }else context.read<MLoginModel>().changetxt('password is no true');
    }).catchError((erorr) {
      print('eroooooor $erorr');
      context.read<MLoginModel>().changetxt('erorr change');
    });
  }

  @override
  Widget build(BuildContext context) {
    String username = context.watch<MLoginModel>().username;
    String password = context.watch<MLoginModel>().password;
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            'Change Password',
            style: TextStyle(letterSpacing: 2, color: Colors.grey[800]),
          ),
          leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SettingScreen(),
              )),),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: sh * 0.02, horizontal: sw * 0.02),
              child: Column(
                children: [
                  buildTextFormField(
                      sh: sh,
                      sw: sw,
                      txtLabel: 'Inter Old Password',
                      controler: oldPass,
                      fun: (){
                        setState(() {
                          eyes1 = !eyes1 ;
                        });
                      } ,
                    icon: eyes1?Icons.lock:Icons.lock_open,
                  ),
                  buildTextFormField(
                      sh: sh,
                      sw: sw,
                      txtLabel: 'Inter New Password',
                      controler: newPass,
                      fun: (){
                        setState(() {
                          eyes2 = !eyes2 ;
                        });
                      },
                    icon: eyes2?Icons.lock:Icons.lock_open
                  ),
                  buildTextFormField(
                      sh: sh,
                      sw: sw,
                      txtLabel: 'Confirm Password',
                      controler: conPass,
                      fun: (){
                        setState(() {
                          eyes3 = !eyes3 ;
                        });
                      },
                    icon: eyes3?Icons.lock:Icons.lock_open,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                      minimumSize: MaterialStateProperty.all(Size(sw*0.9,sh*0.08)),
                    ),
                   onPressed: (){
                    chanhepassword(username, context);
                   },
                   child: Text('Change password',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w600,letterSpacing: 2),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTextFormField(
      {required double sh,
      required double sw,
      required txtLabel,
      required controler,
      required Function fun,
      required IconData icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sh * 0.02, horizontal: sw * 0.02),
      child: TextFormField(

        minLines: 1,
        maxLines: 1,
obscureText: true,
        controller: controler,
        style: TextStyle(color: Colors.white70),
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hoverColor: Colors.orangeAccent,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrangeAccent),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          labelText: txtLabel,
          labelStyle: TextStyle(
            fontSize: sh * 0.02,
            color: Colors.amber,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: sw * 0.03),
            child: IconButton(
                splashRadius: 25,
                onPressed:()=>  fun() ,
                icon: Icon(
                  icon ,
                  color: Colors.yellow[900],
                  size: sh * 0.03,
                )),
          ),
        ),
        validator: (value) {},
      ),
    );
  }
}
