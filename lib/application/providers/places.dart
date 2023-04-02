import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_photo_and_map/application/models/place.dart';
import 'package:flutter_photo_and_map/application/models/place_location.dart';
import 'package:flutter_photo_and_map/application/utils/helpers/db_helper.dart';

import '../utils/helpers/location_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get getItems {
    return [..._items];
  }

  Future<void> fetchPlaces() async {
    var placesData = await DBHelper.getData(DBHelper.PLACE_TABLE_NAME);
    _items = placesData.map((e) => Place.fromDBMap(e)).toList();
    notifyListeners();
  }

  Future<void> addPlace(
      String title, File selectedImage, PlaceLocation selectedLocation) async {
    if (selectedLocation.address == null) {
      var address = await LocationHelper.generateAddressFromCoordinates(
          selectedLocation.latitude, selectedLocation.longitude);
      selectedLocation = selectedLocation.copyWith(address: address);
    }
    Place p = Place(
      id: 'Place_${DateTime.now().toIso8601String()}',
      name: title,
      photo: selectedImage,
      location: selectedLocation,
    );
    _items.add(p);
    DBHelper.insert(
      DBHelper.PLACE_TABLE_NAME,
      p.toDBMap(),
    );
    notifyListeners();
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
