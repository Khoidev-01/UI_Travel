import 'package:flutter/material.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/Core/extensions/date_ext.dart';
import 'package:travel/Core/helpers/asset_helper.dart';
import 'package:travel/representation/screen/guest_and_room_screen.dart';
import 'package:travel/representation/screen/hotel_screen.dart';
import 'package:travel/representation/screen/select_date_screen.dart';
import 'package:travel/representation/widgets/app_bar_container.dart';
import 'package:travel/representation/widgets/button_widgets.dart';
import 'package:travel/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, this.destination});

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotel booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2 ,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconlocation,
              title: 'Destination',
              description: widget.destination ?? 'Viet Nam',
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconcalender,
              title: 'Select Date',
              description: dateSelected ?? 'Select Date',
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                if (result is List<DateTime?>) {
                  setState(() {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconroom,
              title: 'Guest and Room',
              description: guestAndRoom ?? 'Guest and Room',
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
                if ( result != null && result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              ontap: () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
