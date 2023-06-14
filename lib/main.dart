import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_dairy_app/models/locale.dart';
import 'package:my_dairy_app/screens/splash_screen.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      translations: Locales(),
      locale: const Locale("en","US"),
    );
  }
}

