import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/color_constants.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/Core/helpers/image_helper.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/representation/screen/hotel_detail.dart';
import 'package:travel/representation/widgets/button_widgets.dart';
import 'package:travel/representation/widgets/dashline.dart';

class ItemHotelModel extends StatelessWidget {
  const ItemHotelModel({super.key, required this.hotelmodel});

  final HotelModel hotelmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: kMediumPadding),
            child: ImageHelper.loadFromAsset(
              hotelmodel.hotelimage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelmodel.hotelname,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.iconlocation2),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelmodel.hotellocation),
                    Expanded(
                      child: Text(
                        '- ${hotelmodel.hotelkilometer} from destination',
                        style: const TextStyle(
                          color: ColorPalette.subtitleColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.iconstar),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelmodel.hotelstar.toString()),
                    Text(
                      '- ${hotelmodel.hotelreview} reviews',
                      style: const TextStyle(
                        color: ColorPalette.subtitleColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelmodel.hotelprice}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          const Text(
                            '/night',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Book a room',
                        ontap: () {
                          Navigator.of(context).pushNamed(
                            HotelDetailScreen.routeName,
                            arguments: hotelmodel,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
