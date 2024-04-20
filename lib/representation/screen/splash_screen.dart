import 'package:flutter/material.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/Core/helpers/image_helper.dart';
import 'package:travel/representation/screen/intro_screen.dart';
import 'package:travel/representation/screen/main_app.dart';

import '../../Core/helpers/local_storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;
    await Future.delayed(const Duration(seconds: 2));
    if (ignoreIntroScreen != null && ignoreIntroScreen) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageBackGroundSplash,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageCircleSplash,
          ),
        )
      ],
    );
  }
}
