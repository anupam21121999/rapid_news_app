import 'package:daily_news_app/views/login_screen.dart';
import 'package:daily_news_app/views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isShowingSplash = true;

  LoadHome() {
    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        isShowingSplash = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isShowingSplash ? SplashScreen() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

