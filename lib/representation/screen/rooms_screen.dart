import 'package:flutter/cupertino.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/data/models/room_models.dart';
import 'package:travel/representation/screen/check_out_screen.dart';
import 'package:travel/representation/widgets/app_bar_container.dart';
import 'package:travel/representation/widgets/item_room_widget.dart';

class RoomsScreen extends StatefulWidget {
  static const String routeName = '/rooms_screen';
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select room',
      child: SingleChildScrollView(
        child: Column(
          children: listRoom
              .map(
                (e) => ItemRoomWidget(
                  roomModel: e,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CheckOutScreen.routeName, arguments: e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
