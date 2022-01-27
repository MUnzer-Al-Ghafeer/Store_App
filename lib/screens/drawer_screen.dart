import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/screens/about_screen.dart';
import 'package:test1/widgets/icon_widget.dart';
import 'package:test1/screens/login_screen.dart';
import 'package:test1/screens/cart_screen.dart';
import 'package:test1/screens/purchases_screen.dart';
import 'package:test1/screens/setting_screen.dart';
import 'package:test1/widgets/text_widget.dart';

import 'activities_screen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.black.withOpacity(0.6),
          // Colors.black.withOpacity(0.5),
          Colors.deepOrangeAccent,
        ],
      )),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              width: sw,
              height: sh * 0.3,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.withOpacity(0.5),
                image: DecorationImage(
                  image: ExactAssetImage('images/drawer.jpg',),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                ),
              ),
              child:
              Align(
                alignment: Alignment.bottomLeft,
                child: BuildTextWidget(
                    txt: 'MUnzer AL Ghafeer Store',
                    color: Colors.grey[800],
                    FontWeight: FontWeight.w600,
                    size: sh * 0.023,
                    sh: sh * 0.01,
                    sw: sw * 0.02)

              )
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                SizedBox(height: sh*0.02,),
               InkWell(
                 onTap: (){
                   Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                         builder: (context) => SettingScreen(),
                       ));
                 },
                 child: Row(
                   children: [
                   BuildIconWidget(
                     icon: Icons.settings,
                     color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                   ),
                   BuildTextWidget(txt: 'Setting',
                   color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                     FontWeight: FontWeight.normal,
                   )
                 ],),
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => CartScreen(),
                       ));
                 },
                 child: Row(children: [
                   BuildIconWidget(
                     icon: Icons.shopping_cart_outlined,
                     color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                   ),
                   BuildTextWidget(txt: 'My Cart',
                   color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                     FontWeight: FontWeight.normal,
                   )
                 ],),
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => PurchasesScreen(),
                       ));
                 },
                 child: Row(children: [
                   BuildIconWidget(
                     icon: Icons.shop,
                     color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                   ),
                   BuildTextWidget(txt: 'My Purchases',
                   color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                     FontWeight: FontWeight.normal,
                   )
                 ],),
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => ActivitiesScreen(),
                       ));
                 },
                 child: Row(children: [
                   BuildIconWidget(
                     icon: Icons.menu,
                     color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                   ),
                   BuildTextWidget(txt: 'My Activites',
                   color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                     FontWeight: FontWeight.normal,
                   )
                 ],),
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => AboutScreen(),
                       ));
                 },
                 child: Row(children: [
                   BuildIconWidget(
                     icon: Icons.person,
                     color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                   ),
                   BuildTextWidget(txt: 'About',
                   color: Colors.white70,
                     size: sh*0.03,
                     sw: sw*0.04,
                     sh: sh*0.02,
                     FontWeight: FontWeight.normal,
                   )
                 ],),
               ),
                Spacer(),
                Divider(color: Colors.white70,),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
                child: Row(children: [
                  BuildIconWidget(
                    icon: Icons.logout,
                    color: Colors.white70,
                    size: sh*0.03,
                    sw: sw*0.04,
                    sh: sh*0.02,
                  ),
                  BuildTextWidget(txt: 'Log out',
                    color: Colors.white70,
                    size: sh*0.03,
                    sw: sw*0.04,
                    sh: sh*0.02,
                    FontWeight: FontWeight.normal,
                  ),
                ],
                ),
            ),
          ),
        ],
      ),
    ));
  }
}
