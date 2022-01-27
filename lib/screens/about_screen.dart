import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.deepOrangeAccent,),onPressed: ()=> Navigator.pop(context),),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Colors.deepOrange.withOpacity(0.7),
                Colors.grey.shade800.withOpacity(0.5),
                // Colors.grey.withOpacity(0.3),
                Colors.black12.withOpacity(0.2),
              ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircleAvatar(sh: sh,maxSize: 0.05, image: AssetImage('images/login_images/logo1.jpg',), childWidhet: null),
                    SizedBox(width: sw * 0.05),
                    buildText(
                        sh: sh, txt: "Flut", clr: Colors.black54, sizeText: 0.05),
                    buildText(
                        sh: sh, txt: "ter ", clr: Colors.black45, sizeText: 0.05),
                    buildText(
                        sh: sh, txt: "  Sto", clr: Colors.black26, sizeText: 0.05),
                    buildText(
                        sh: sh, txt: "re", clr: Colors.black12, sizeText: 0.05),
                  ],
                ),
                SizedBox(height: sh * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircleAvatar(
                      sh: sh,
                      maxSize: 0.04,
                      image: null,
                      childWidhet: Icon(
                        Icons.circle_notifications_sharp,
                        color: Colors.white70.withOpacity(0.5),
                        size: sh * 0.05,
                      ),
                    ),
                    SizedBox(width: sw * 0.05),
                    buildText(
                        sh: sh, txt: 'Vers', clr: Colors.black54, sizeText: 0.04),
                    buildText(
                        sh: sh, txt: 'ion', clr: Colors.black45, sizeText: 0.04),
                    buildText(
                        sh: sh, txt: ' _ _ _ ',
                        clr: Colors.white30,
                        sizeText: 0.04),
                    buildText(
                        sh: sh, txt: '2.8', clr: Colors.white, sizeText: 0.02),
                  ],
                ),
                SizedBox(height: sh * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircleAvatar(
                      sh: sh,
                      maxSize: 0.03,
                      image: null,
                      childWidhet: Icon(Icons.share,
                          color: Colors.white70.withOpacity(0.5),
                          size: sh * 0.04),
                    ),
                    SizedBox(width: sw * 0.05),
                    buildText(
                        sh: sh, txt: 'Shar', clr: Colors.black54, sizeText: 0.03),
                    buildText(
                        sh: sh,
                        txt: 'e  My ',
                        clr: Colors.black45,
                        sizeText: 0.03),
                    buildText(
                        sh: sh, txt: 'app ', clr: Colors.black26, sizeText: 0.03),
                  ],
                ),
                SizedBox(height: sh * 0.07),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw * 0.1),
                  child: Text(
                    "Flutter!!\nFlutter is Google's mobile UI framework for crafting high-quality native interfaces on iOS, Android, web, and desktop.\nFlutter works with existing code, is used by developers and organizations around the world, and is free and open source.\nLearn more at https://flutter.dev.com",
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sh * 0.025, fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar buildCircleAvatar(
      {required double sh,
      required double maxSize,
      required image,
      required childWidhet}) {
    return CircleAvatar(
      backgroundColor: Colors.deepOrange.withOpacity(0.5),
      maxRadius: sh * maxSize,
      backgroundImage: image,
      child: childWidhet,
    );
  }

  Text buildText(
          {required double sh,
          required String txt,
          required Color clr,
          required double sizeText}) =>
      Text(
        txt,
        style: TextStyle(
            color: clr, fontSize: sh * sizeText, fontStyle: FontStyle.italic),
      );
}

// Text(
// 'ter ',
// style: TextStyle(
// color: Colors.black45,
// fontSize: sh * 0.05,
// fontStyle: FontStyle.italic),
// ),
// Text(
// '  Sto',
// style: TextStyle(
// color: Colors.black26,
// fontSize: sh * 0.05,
// fontStyle: FontStyle.italic),
// ),
// Text(
// 're',
// style: TextStyle(
// color: Colors.black12,
// fontSize: sh * 0.05,
// fontStyle: FontStyle.italic),
// ),
