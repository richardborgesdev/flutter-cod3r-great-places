import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/places.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: PlaceLocation(latitude: 0, longitude: 0),
      image: image,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
