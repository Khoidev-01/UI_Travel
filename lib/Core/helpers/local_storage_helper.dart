import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _share = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _share;
  }

  Box<dynamic>? hiveBox;

  static initLocalStorageHelper() async {
    _share.hiveBox = await Hive.openBox('TravelApp');
  }

  static dynamic getValue(String key) {
    return _share.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _share.hiveBox?.put(key, val);
  }
}