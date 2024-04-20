import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/Constants/textstyle_constants.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/Core/helpers/image_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/screen/rooms_screen.dart';
import 'package:travel/representation/widgets/dashline.dart';
import 'package:travel/representation/widgets/item_button_widget.dart';
import 'package:travel/representation/widgets/item_utility_hotel_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  static const String routeName = '/hotel_detail';

  const HotelDetailScreen({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.room,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(kItemPadding),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: kDefaultPadding,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(kItemPadding),
                child: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultPadding,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            kItemPadding,
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.hotelModel.hotelname,
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${widget.hotelModel.hotelprice.toString()}',
                                    style:
                                        TextStyles.defaultStyle.fontHeader.bold,
                                  ),
                                  Text(
                                    '/night',
                                    style: TextStyles.defaultStyle.fontCaption,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              Row(
                                children: [
                                  ImageHelper.loadFromAsset(
                                    AssetHelper.iconlocation2,
                                  ),
                                  const SizedBox(
                                    height: kMinPadding,
                                  ),
                                  Text(
                                    ' ${widget.hotelModel.hotellocation}',
                                  ),
                                  Text(
                                    ' - ${widget.hotelModel.hotelkilometer} from destination',
                                    style: TextStyles.defaultStyle
                                        .subTitleTextColor.fontCaption,
                                  ),
                                ],
                              ),
                              const DashLineWidget(),
                              Row(
                                children: [
                                  ImageHelper.loadFromAsset(
                                    AssetHelper.iconstar,
                                  ),
                                  const SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    widget.hotelModel.hotelstar.toString(),
                                  ),
                                  Text(
                                    '  (${widget.hotelModel.hotelreview} reviews)',
                                    style: TextStyles
                                        .defaultStyle.subTitleTextColor,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See All',
                                    style: TextStyles
                                        .defaultStyle.bold.primarycolor,
                                  ),
                                ],
                              ),
                              const DashLineWidget(),
                              const Text(
                                'Informations',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              const Text(
                                '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                              ),
                              const ItemutilityHotelWidget(),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              const Text(
                                'Informations',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              const Text(
                                '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              ImageHelper.loadFromAsset(
                                AssetHelper.map,
                                width: double.infinity,
                              ),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                              ItemButtonWidget(
                                data: 'Select Room',
                                ontap: () {
                                  Navigator.of(context)
                                      .pushNamed(RoomsScreen.routeName);
                                },
                              ),
                              const SizedBox(
                                height: kDefaultPadding * 1.5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
