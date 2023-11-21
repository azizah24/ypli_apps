import 'package:flutter/material.dart';
import 'package:ypli_apps/auth/forgot_password.dart';
import 'package:ypli_apps/auth/login_page.dart';
import 'package:ypli_apps/auth/register_page.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/loginPage',
        routes: routes,
        onGenerateRoute: _generateRoute,
        home: LoginPage());
  }

    dynamic routes = {
     
    '/loginPage': (BuildContext context) => const LoginPage(),
  };

  Route  _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // FIRST PAGE
     
      case '/loginPage':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/registerPage':
        return MaterialPageRoute(
            builder: (context) => RegisterPage());
      case '/forgotPasswordPage':
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      default:
        return MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
}
