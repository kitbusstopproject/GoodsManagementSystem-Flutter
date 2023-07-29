import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodsmanagementsystem/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goodsmanagementsystem/firebase/get_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetFireStore.getCategory();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'GoodsManagementSystemApp',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "MPLUSRounded",
        colorSchemeSeed: Colors.white,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: "MPLUSRounded",
        colorSchemeSeed: Colors.white,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}
