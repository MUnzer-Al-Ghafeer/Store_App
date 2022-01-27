import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test1/screens/changePassword_screen.dart';
import 'package:test1/models/database_model.dart';
import 'package:test1/models/provider_model.dart';
import 'package:test1/screens/drawer_screen.dart';
import 'package:test1/widgets/drawer_widget.dart';
import 'package:test1/screens/home_screen.dart';
import 'package:test1/models/login_provider_model.dart';
import 'package:test1/screens/cart_screen.dart';
import 'package:test1/screens/setting_screen.dart';
import 'package:test1/screens/splash_screen.dart';
import 'package:test1/models/user_model.dart';
import 'screens/about_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/login_screen.dart';
import 'models/myCart_model.dart';
import 'screens/signup_screen.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   DatabaseService();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider<MLoginModel>(
        create: (_) => MLoginModel(),
      ),
      ChangeNotifierProvider<ProviderModel>(
        create: (_) => ProviderModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finel Project',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MySplashScreen(),
      // '/introScreen': (context) => IntroScreen(),
      // '/logInScreen': (context) => LogInScreen(),
      // '/registerScreen': (context) => RegisterScreen(),
      // '/profileScreen': (context) => MyProfile(),
      // ChangePass.id: (context) => ChangePass(),
      // },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
