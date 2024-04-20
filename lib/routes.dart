import 'package:flutter/material.dart';
import 'package:travel/data/models/hotel_model.dart';
import 'package:travel/data/models/room_models.dart';
import 'package:travel/representation/screen/check_out_screen.dart';
import 'package:travel/representation/screen/hotel_detail.dart';
import 'package:travel/representation/screen/guest_and_room_screen.dart';
import 'package:travel/representation/screen/hotel_booking_screen.dart';
import 'package:travel/representation/screen/hotel_screen.dart';
import 'package:travel/representation/screen/intro_screen.dart';
import 'package:travel/representation/screen/main_app.dart';
import 'package:travel/representation/screen/rooms_screen.dart';
import 'package:travel/representation/screen/select_date_screen.dart';

final Map<String, WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => HotelScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}
