import 'package:chattr/constants/constants.dart';
import 'package:chattr/helper/helper_function.dart';
import 'package:chattr/pages/home_page.dart';
import 'package:chattr/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constacts.apiKey,
            appId: Constacts.appId,
            messagingSenderId: Constacts.messagingSenderId,
            projectId: Constacts.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedinStatus();
  }

  getUserLoggedinStatus() async {
    await HelperFunctions.getUserLoggedinStatus().then((value) => {
          if (value != null) {_isSignedin = value}
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Constacts().primaryColor,
          scaffoldBackgroundColor: Colors.yellow.shade100),
      debugShowCheckedModeBanner: false,
      home: _isSignedin ? const HomePage() : const LoginPage(),
    );
  }
}
