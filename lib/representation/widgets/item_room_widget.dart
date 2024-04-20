import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/Constants/textstyle_constants.dart';
import 'package:travel/Core/helpers/image_helper.dart';
import 'package:travel/data/models/room_models.dart';
import 'package:travel/representation/widgets/dashline.dart';
import 'package:travel/representation/widgets/item_button_widget.dart';
import 'package:travel/representation/widgets/item_utility_hotel_widget.dart';

class ItemRoomWidget extends StatelessWidget {
  const ItemRoomWidget({
    super.key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  });

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          color: Colors.white),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomModel.utility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(roomModel.roomImage,
                    radius: BorderRadius.circular(kItemPadding)),
              ),
            ],
          ),
          const ItemutilityHotelWidget(),
          const DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ItemButtonWidget(
                        data: 'Choose',
                        ontap: onTap,
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
