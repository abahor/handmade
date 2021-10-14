import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/screens/about_us_screen.dart';
import '/screens/account_overview_screen.dart';
import '/screens/auth_screen.dart';
import '/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
          // fontFamily: 'Lato',
          // pageTransitionsTheme: PageTransitionsTheme(builders: {
          //
          //
          // })
      ),
      home: HomeScreen(),

    routes: {
        AuthScreen.routeName : (ctx) => AuthScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        About_us.routeName: (ctx) => About_us(),
      AccountOverViewScreen.routeName: (ctx) => AccountOverViewScreen(),
    },
      // HomeScreen(),
    );
  }
}



