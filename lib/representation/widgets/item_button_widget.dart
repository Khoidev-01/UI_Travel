import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/color_constants.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/Constants/textstyle_constants.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({super.key, required this.data, this.ontap, this.color});

  final String data;
  final Function()? ontap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
              ? TextStyles.defaultStyle.whiteTextColor.bold
              : TextStyles.defaultStyle.bold.copyWith(
            color: ColorPalette.primaryColor,
          ),
        ),
      ),
    );
  }
}
