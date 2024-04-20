import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/Core/helpers/image_helper.dart';

class ItemutilityHotelWidget extends StatelessWidget {
  const ItemutilityHotelWidget({super.key});

  static const List<Map<String, String>> listUnityHotel = [
    {'icon': AssetHelper.iconwifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.iconrestaurant, 'name': 'Free\nBreakfast'},
    {'icon': AssetHelper.iconbreak, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.iconsmoke, 'name': 'Non-\nSmoking'},
  ];

  Widget _buildItemUtilityHotelWidget(
      {required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon,
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUnityHotel
            .map(
              (e) => _buildItemUtilityHotelWidget(
                icon: e['icon']!,
                name: e['name']!,
              ),
            )
            .toList(),
      ),
    );
  }
}
