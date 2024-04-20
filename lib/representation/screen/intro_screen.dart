import 'dart:async';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/Constants/textstyle_constants.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/Core/helpers/image_helper.dart';
import 'package:travel/representation/screen/main_app.dart';
import 'package:travel/representation/widgets/button_widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = 'intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buidItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 413,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buidItemIntroScreen(
                  AssetHelper.imageIntro1,
                  'Book a flight',
                  'Found a flight that matches your destination and schedule? Book it instantly.',
                  Alignment.centerRight),
              _buidItemIntroScreen(
                AssetHelper.imageIntro2,
                'Find a hotel room',
                'Select the day, book your room. We give you the best price.',
                Alignment.center,
              ),
              _buidItemIntroScreen(
                AssetHelper.imageIntro3,
                'Enjoy your trip',
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 1,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 3,
                      child: ButtonWidget(
                        title: snapshot.data != 2 ? 'Next' : 'Get started',
                        ontap: () {
                          if ((_pageController.page != 2)) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          } else {
                            Navigator.of(context).pushNamed(MainApp.routeName);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
