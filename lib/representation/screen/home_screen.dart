import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/Constants/textstyle_constants.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/Core/helpers/image_helper.dart';
import '../widgets/app_bar_container.dart';
import 'hotel_booking_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Korea',
      'image': AssetHelper.korea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.dubai,
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
    },
  ];

  Widget _builtItemCategory(
    Widget icon,
    Color color,
    Function() onTap,
    String title,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(kItemPadding)),
            child: icon,
          ),
          const SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  Widget _buildImageHomScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor.bold,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.0')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kMediumPadding * 2,
                ),
                Text(
                  'Hello!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            const SizedBox(
              width: kTopPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kItemPadding,
                  ),
                  color: Colors.white),
              padding: const EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.avt),
            ),
          ],
        ),
      ),
      implementLeading: false,
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultPadding,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kItemPadding,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kItemPadding,
              ),
            ),
            style: TextStyles.defaultStyle,
            onChanged: (value) {},
            onSubmitted: (String submitValue) {},
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _builtItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icon1,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  const Color(0xffFE9C5E),
                  () {
                    Navigator.of(context)
                        .pushNamed(HotelBookingScreen.routeName);
                  },
                  'Hotel',
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _builtItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icon2,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  const Color(0xffF77777),
                  () {},
                  'Flight',
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _builtItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icon3,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  const Color(0xff3EC8BC),
                  () {},
                  'All',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Row(
            children: [
              Text(
                'Popular Destinations',
                style: TextStyles.defaultStyle.bold,
              ),
              const Spacer(),
              Text(
                'See All',
                style: TextStyles.defaultStyle.bold.primarycolor,
              ),
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: listImageLeft
                          .map(
                            (e) => _buildImageHomScreen(
                              e['name']!,
                              e['image']!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      children: listImageRight
                          .map(
                            (e) => _buildImageHomScreen(
                              e['name']!,
                              e['image']!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
