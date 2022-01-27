import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/provider_model.dart';
import 'package:test1/screens/drawer_screen.dart';
import '../screens/home_screen.dart';
import '../models/login_provider_model.dart';


class DrawerAndHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   ZoomDrawer(
      controller: context.watch<ProviderModel>().zoomDrawerController,
      mainScreen: HomeScreen(),
      menuScreen: DrawerScreen(),
      borderRadius: 24,
      showShadow: true,
      angle: -8.0,
      slideWidth: MediaQuery.of(context).size.width*.65,
      style: DrawerStyle.Style1,
      openCurve: Curves.easeInExpo,
      closeCurve: Curves.easeInOut,
      backgroundColor: Colors.black45,
    );
  }
}
