import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/representation/widgets/app_bar_container.dart';
import '../../Core/Constants/color_constants.dart';
import '../widgets/button_widgets.dart';
import '../widgets/item_change_guest_and_room.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({super.key});

  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {

  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountGuest = GlobalKey<ItemChangeGuestAndRoomState>();
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountRoom = GlobalKey<ItemChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add guest and room',
      paddingContent: const EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountGuest,
            initData: 1,
            icon: AssetHelper.iconguest,
            value: 'Guest',
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountRoom,
            initData: 1,
            icon: AssetHelper.iconroom2,
            value: 'Room',
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Select',
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            color: ColorPalette.primaryColor.withOpacity(0.1),
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
