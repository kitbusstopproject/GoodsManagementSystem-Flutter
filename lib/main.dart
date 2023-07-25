import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goodsmanagementsystem/firebase/getFireStore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetFireStore.getCategory();
  runApp(const MyApp());
}

// ignore: constant_identifier_names
const SeedColor = Color(0xFFEAA4A4);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoodsManagementSystemApp',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: SeedColor,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: SeedColor,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

