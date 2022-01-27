import 'package:flutter/material.dart';
import 'dart:ui';


class buildTextFormFieldWidget extends StatelessWidget {
  TextEditingController? controler = TextEditingController();
  var keyboardType;
  var sh;
  var sw;
  var icon;
  var lablel_text;
  IconData? endIcon ;
  Function? funIcon ;
  bool isPass;
  FormFieldValidator<String> ifvalidate ;
  FormFieldSetter<String> onsave ;
  TextInputAction textInputAction ;
  FocusNode? focusNode ;
  FocusNode? focusName ;

  buildTextFormFieldWidget(
      { this.controler,
        required this.ifvalidate,
        required this.onsave,
        required this.keyboardType,
        required this.sh,
        required this.sw,
        required this.icon,
        required this.lablel_text,
        required this.isPass,
        required this.endIcon,
        required this.funIcon,
        required this.textInputAction,
        required this.focusNode,
        required this.focusName,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw*0.02,vertical: sh*0.01),
      child: TextFormField(
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(focusName);
        },
        textInputAction: textInputAction,
        obscureText: isPass ,
        style: TextStyle(color: Colors.grey),
        controller: controler,
        validator: ifvalidate,
        onSaved: onsave,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(15)
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          hoverColor: Colors.white54,
          labelText: lablel_text,
          labelStyle: TextStyle(
            fontSize: sh * 0.02,
            color: Colors.orange,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.yellow[900],
            size: sh * 0.03,
          ),
          suffixIcon: IconButton(icon: Icon(endIcon),onPressed: ()=> funIcon!(),color: Colors.yellow[900],),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
