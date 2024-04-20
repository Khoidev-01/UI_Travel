import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel/routes.dart';
import 'package:travel/representation/screen/splash_screen.dart';
import 'Core/Constants/color_constants.dart';
import 'Core/helpers/local_storage_helper.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
