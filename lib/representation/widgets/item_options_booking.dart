import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/Constants/textstyle_constants.dart';
import 'package:travel/Core/helpers/image_helper.dart';

class ItemOptionsBookingWidget extends StatelessWidget {
  const ItemOptionsBookingWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String value;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTopPadding),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(bottom: kMediumPadding),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              icon,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.fontCaption,
                ),
                const SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  value,
                  style: TextStyles.defaultStyle.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
