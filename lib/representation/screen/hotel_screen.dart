import 'package:flutter/material.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/widgets/app_bar_container.dart';
import 'package:travel/representation/widgets/item_hotel_model.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  static const String routeName = '/hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(
      hotelimage: AssetHelper.hotel1,
      hotelname: 'Royal Palm Heritage',
      hotellocation: 'Purwokerto, Jateng',
      hotelkilometer: '364 m',
      hotelstar: 4.5,
      hotelreview: 3241,
      hotelprice: 143,
    ),
    HotelModel(
      hotelimage: AssetHelper.hotel2,
      hotelname: 'Grand Luxury\'s',
      hotellocation: 'Banyumas, Jateng',
      hotelkilometer: '2.3 km',
      hotelstar: 4.2,
      hotelreview: 3241,
      hotelprice: 234,
    ),
    HotelModel(
      hotelimage: AssetHelper.hotel3,
      hotelname: 'The Orlando House',
      hotellocation: 'Ajibarang, Jateng',
      hotelkilometer: '1.1 km',
      hotelstar: 3.8,
      hotelreview: 1234,
      hotelprice: 132,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children: listHotel
              .map(
                (e) => ItemHotelModel(
                  hotelmodel: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
